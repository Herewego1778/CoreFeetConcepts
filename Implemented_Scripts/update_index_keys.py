"""
Description: This Python script updates categorized_index.md with changes from user_index.md. It 
             removes missing entries, sorts, and logs changes to CS_Knowledge_Base/command_log.md.

Script Name: update_index_keys.py
"""

import os
import re
from log_message import log_message # Import the log_message.py file to store log errors and activities

def update_and_sort_index(user_index_file, categorized_index_file):
    """Updates categorized_index.md, removes missing entries, and sorts."""

    # Read existing categorized_index.md
    existing_data = {}
    if os.path.exists(categorized_index_file):
        with open(categorized_index_file, "r") as cat_file:
            for line in cat_file:
                line = line.strip()
                if line:
                    value, key = line.split(": ", 1)
                    existing_data[value] = key

    # Read user_index.md
    user_index_values = set()
    with open(user_index_file, "r", encoding="utf-8-sig") as user_file:
        for line in user_file:
            line = line.strip()
            if line:
                user_index_values.add(line)

    # Identify values to remove
    values_to_remove = set(existing_data.keys()) - user_index_values

    # Remove missing values
    for value in values_to_remove:
        del existing_data[value]

    # Identify new entries
    new_entries = user_index_values - set(existing_data.keys())

    # Generate new keys for new entries
    used_keys = set(existing_data.values()) # Set of keys that are already used
    new_keys = {} # Dictionary to store new entries and their generated keys

    for entry in new_entries:
        folder_name = os.path.basename(entry) # Get the folder name from the path
        cleaned_name = re.sub(r'[^a-zA-Z0-9]', '', folder_name).lower() # Remove non-alphanumeric characters and convert to lowercase
        
        # Generate key by taking the first character of each word separated by underscores
        key = "".join(word[0] for word in cleaned_name.split("_"))

        # Ensure the key is at most 8 characters long
        if len(key) > 8:
            key = key[:8]
        # Ensure the key is at least 3 characters long
        elif len(key) < 3:
            if len(cleaned_name) >= 3:
                key = cleaned_name[:3]
            else:
                key = cleaned_name

        original_key = key
        suffix = ""
        counter = 1

        # Ensure the generated key is unique
        while key in used_keys:
            suffix = chr(ord('a') + (counter - 1)) # Generate a suffix by incrementing alphabetically
            key = f"{original_key}{suffix}"
            if len(key) > 8:
                key = key[:8] # Trim the key to 8 characters if it exceeds the limit
            counter += 1

        new_keys[entry] = key # Store the new key
        used_keys.add(key) # Add the new key to the set of used keys

    # Combine existing and new data, sort by value
    combined_data = {**existing_data, **new_keys}
    sorted_data = sorted(combined_data.items())

    # Write to categorized_index.md
    with open(categorized_index_file, "w", encoding="utf-8-sig") as cat_file:
        for value, key in sorted_data:
            cat_file.write(f"{value}: {key}\n")
    
    # Log success message
    log_message(f"File 'categorized_index.md' updated and sorted.", "Python", basePath)

# Open current_dir.md inside the current folder to combine paths
try:
    with open("current_dir.md", "r", encoding="utf-8-sig") as homeDirectory:
        basePath = next(homeDirectory).strip() # Read the first line

    user_index_file = os.path.join(basePath, "My_Projects", "CoreFeetConcepts", "user_index.md")
    output_file = os.path.join(basePath, "My_Projects", "CoreFeetConcepts", "categorized_index.md")
except FileNotFoundError:
    print("Error: current_dir.md not found.")
except StopIteration:
    print("Error: current_dir.md is empty.")

update_and_sort_index(user_index_file, output_file)

print(f"categorized_index.md updated, sorted, and preserved keys.")
