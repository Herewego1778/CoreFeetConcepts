"""
Description: This Python script reads from `user_index.md`, generates unique keys for each entry, 
             and writes the entries and keys to `categorized_index.md`, which is used by 
             `update_index_keys.py`.

Script Name: create_unique_index_keys.py
"""

import os
import re

def generate_lowercase_keys(user_index_file, output_file):
    """Generates lowercase letter-based unique keys from folder names and writes them to a file."""

    used_keys = set()
    key_map = {}

    # Open the user_index_file for reading and the output_file for writing
    with open(user_index_file, "r") as user_file, open(output_file, "w") as out_file:
        # Iterate through each line in the user_index_file
        for line in user_file:
            line = line.strip() # Remove any leading/trailing whitespace from the line
            if not line: # If the line is empty, skip it
                continue
            # Process the non-empty line (remaining code follows)
            # Store the non-empty line as the relative path
            relative_path = line
            # Extract the folder name from the relative path
            folder_name = os.path.basename(relative_path)
            
            # Remove non-alphanumeric characters and convert to lowercase
            cleaned_name = re.sub(r'[^a-zA-Z0-9]', '', folder_name).lower()

            words = cleaned_name.split("_")

            # Generate initial key using the first letters of words
            key = "".join(word[0] for word in words)

            # Adjust key length
            if len(key) > 8:
                key = key[:8]  # Truncate to 8 characters if too long
            elif len(key) < 3:
                # Use a portion of the folder name as a key if too short
                if len(cleaned_name) >= 3:
                    key = cleaned_name[:3]
                else:
                    key = cleaned_name

            # Ensure uniqueness (using letters)
            original_key = key
            suffix = ""
            counter = 1
            while key in used_keys:
                # Add letters to the key until it's unique
                suffix = chr(ord('a') + (counter - 1))  # Add a lowercase letter
                key = f"{original_key}{suffix}"
                if len(key) > 8:
                    key = key[:8]  # Truncate if it exceeds 8 characters
                counter += 1

            used_keys.add(key)
            out_file.write(f"{relative_path}: {key}\n")

# Open current_dir.md inside the current folder to combine paths
try:
    with open("current_dir.md", "r", encoding="utf-8-sig") as homeDirectory:
        basePath = next(homeDirectory).strip()  # Read the first line

    user_index_file = os.path.join(basePath, "My_Projects", "CoreFeetConcepts", "user_index.md")
    output_file = os.path.join(basePath, "My_Projects", "CoreFeetConcepts", "categorized_index.md")
    print(f"user_index_file: {user_index_file}")
    print(f"output_file: {output_file}")
except FileNotFoundError:
    print("Error: current_dir.md not found.")
except StopIteration:
    print("Error: current_dir.md is empty.")

# Create the first categorized_index.md with unique keys
generate_lowercase_keys(user_index_file, output_file)
