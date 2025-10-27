import fastf1
from fastf1.ergast import Ergast
import fastf1.plotting as f1plot
import pandas as pd

# Initialize Ergast and FastF1 cache
ergast = Ergast()
fastf1.Cache.enable_cache("cache")

# Load constructor and driver standings
constructorStandings = ergast.get_constructor_standings(season=2025)
driverStandings = ergast.get_driver_standings(season=2025)

# Get the latest standings
constructorLatest = constructorStandings.content[-1]
driverLatest = driverStandings.content[-1]

# Add fullName column to driver standings
driverLatest['fullName'] = driverLatest['givenName'] + ' ' + driverLatest['familyName']

# Load a session to get team colors (e.g., Round 1 race)
event = fastf1.get_event(2025, 1)
race = event.get_session("R")
race.load()

# Function to get team color
def get_team_color(constructor_list):
    if isinstance(constructor_list, list):
        constructor = constructor_list[0]  # take first if multiple
    else:
        constructor = constructor_list
    return f1plot.get_team_color(constructor, session=race)

# Add teamColor column
constructorLatest['teamColor'] = constructorLatest['constructorName'].apply(lambda x: get_team_color([x]))

# Explode constructorNames in driver standings to handle multiple constructors
driverExploded = driverLatest.explode('constructorNames')

# Group drivers by constructor for names
drivers_by_team = (
    driverExploded.groupby("constructorNames")["fullName"]
    .apply(list)
    .reset_index()
    .rename(columns={"fullName": "drivers"})
)

# Group drivers by constructor for points
driverPoints_by_team = (
    driverExploded.groupby("constructorNames")["points"]
    .apply(list)
    .reset_index()
    .rename(columns={"points": "driverPoints"})
)

# Merge names and points into constructor standings
constructorLatest = constructorLatest.merge(
    drivers_by_team,
    left_on="constructorName",
    right_on="constructorNames",
    how="left"
).merge(
    driverPoints_by_team,
    left_on="constructorName",
    right_on="constructorNames",
    how="left"
).drop(columns=["constructorNames_x", "constructorNames_y"])  # drop extra columns

# Mapping official constructorId -> preferred name
constructor_name_map = {
    "rb": "Racing Bulls",
    "sauber": "Kick Sauber",
    "haas": "Haas",
    "alpine": "Alpine"
}

# Fix constructor names
constructorLatest["constructorName"] = constructorLatest.apply(
    lambda row: constructor_name_map.get(row["constructorId"], row["constructorName"]),
    axis=1
)

driver_corrections = {
    "Red Bull": {
        "remove": ["Liam Lawson"],
        "add": [("Yuki Tsunoda", 20.0)]
    },
    "RB": {
        "remove": ["Yuki Tsunoda"],
        "add": [("Liam Lawson", 30.0)]
    }
}

def correct_drivers(row):
    cname = row["constructorName"]
    if cname in driver_corrections:
        correction = driver_corrections[cname]

        # Remove unwanted drivers
        if "remove" in correction:
            new_drivers, new_points = [], []
            for d, p in zip(row["drivers"], row["driverPoints"]):
                if d not in correction["remove"]:
                    new_drivers.append(d)
                    new_points.append(p)
            row["drivers"] = new_drivers
            row["driverPoints"] = new_points

        # Add missing drivers
        if "add" in correction:
            for d, p in correction["add"]:
                if d not in row["drivers"]:
                    row["drivers"].append(d)
                    row["driverPoints"].append(p)

    return row

constructorLatest = constructorLatest.apply(correct_drivers, axis=1)

constructorStandings = constructorLatest[['constructorId', 'constructorName', 'position', 'points', 'drivers', 'driverPoints', 'teamColor']]

# Convert to JSON (list of dicts)
json_data = constructorStandings.to_json(orient="records", date_format="iso")

# Save to file
with open("constructor_standings_2025.json", "w") as f:
    f.write(json_data)

print("JSON file created: constructor_standings_2025.json")