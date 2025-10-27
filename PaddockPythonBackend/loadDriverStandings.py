import fastf1
from fastf1.ergast import Ergast
import fastf1.plotting as f1plot
import pandas as pd

ergast = Ergast()

# Enable cache (important!)
fastf1.Cache.enable_cache("cache")

standings = ergast.get_driver_standings(season=2025)

# standings.content is a list of DataFrames
latest = standings.content[-1]   # get the last round available

givenName = latest['givenName']
familyName = latest['familyName']

# Add the 'fullName' column directly to the 'latest' DataFrame
latest['fullName'] = latest['givenName'] + ' ' + latest['familyName']

# Load a session to use for team colors (e.g., first race)
event = fastf1.get_event(2025, 1)        # Round 1
race = event.get_session("R")
race.load()

def get_team_color(constructor_list):
    if isinstance(constructor_list, list):
        constructor = constructor_list[0]  # take first if multiple
    else:
        constructor = constructor_list
    return f1plot.get_team_color(constructor, session=race)


# Map driver nationality to actual country name
nationality_to_country = {
    "Australian": "Australia",
    "British": "United Kingdom",
    "Dutch": "Netherlands",
    "Monegasque": "Monaco",
    "Italian": "Italy",
    "Thai": "Thailand",
    "French": "France",
    "German": "Germany",
    "Canadian": "Canada",
    "Spanish": "Spain",
    "New Zealander": "New Zealand",
    "Japanese": "Japan",
    "Brazilian": "Brazil",
    "Argentine": "Argentina"
}

driver_corrections = (

)

# Create a new column for full country name
latest['countryName'] = latest['driverNationality'].map(nationality_to_country)

# Add teamColor column
latest['teamColor'] = latest['constructorNames'].apply(get_team_color)

# Map constructor names to preferred forms
constructor_name_map = {
    "RB F1 Team": "Racing Bulls",
    "Sauber": "Kick Sauber",
    "Haas F1 Team": "Haas",
    "Alpine F1 Team": "Alpine"
}

# Apply renames to constructorNames
def rename_constructor(row):
    names = row["constructorNames"]
    new_names = []
    for n in names:
        new_names.append(constructor_name_map.get(n, n))
    row["constructorNames"] = new_names
    return row

latest = latest.apply(rename_constructor, axis=1)

# Manual corrections for Lawson and Tsunoda
driver_corrections = {
    "tsunoda": "Red Bull",
    "lawson": "Racing Bulls"
}

def apply_constructor_corrections(row):
    if row["driverId"] in driver_corrections:
        # Overwrite with a single-item list for the correct team
        row["constructorNames"] = [driver_corrections[row["driverId"]]]
        # Recalculate the team color for the corrected team
        row["teamColor"] = f1plot.get_team_color(row["constructorNames"][0], session=race)
    return row

# Apply corrections
latest = latest.apply(apply_constructor_corrections, axis=1)

driverStandings = latest[["driverId", "position", "driverNumber", "fullName", "countryName", "constructorNames", "teamColor", "points"]]

# Convert to JSON (list of dicts)
json_data = driverStandings.to_json(orient="records", date_format="iso")

# Save to file
with open("../Paddock/driver_standings_2025.json", "w") as f:
    f.write(json_data)

print("JSON file created: ../Paddock/driver_standings_2025.json")