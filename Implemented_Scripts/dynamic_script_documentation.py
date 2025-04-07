# Description: This script dynamically generates a YAML document from a template and a directory of scripts.
#              It extracts metadata (description and name) from each script and combines it with the template.
# Script Name: dynamic_script_documentation.py

import os
from pathlib import Path
import re
import yaml

# --- Custom Representer ---
''' Configures YAML for dumping multiline strings as yaml.dump() has a behavior
that prevents interpreting a multi-line string. Instead this add double quotes to 
each key inside the YAML file this script creates
Ref: https://github.com/yaml/pyyaml/issues/240#issuecomment-2280085838'''
def represent_literal(dumper, data):
    # Remove any trailing spaces messing out the output.
    block = "\n".join([line.rstrip() for line in data.splitlines()])
    if data.endswith("\n"):
        block += "\n"
    return dumper.represent_scalar("tag:yaml.org,2002:str", block, style="|")

yaml.add_representer(str, represent_literal)
# --- End Custom Representer ---

def iterate_files(directory, dynamic_metadata_yaml_file, output_directory):
    
    path = Path(directory)
    all_content = []  # Initialize a list to hold content from all files

    for filepath in path.glob("*"):  # Iterate through all files (and folders)
        if not filepath.is_file():
            continue  # skip folders

        try:
            with open(filepath, "r") as file:
                script_code = file.read()
                script_lines = script_code.rstrip().splitlines()
            # Extract description and name from the first lines
            description_match = re.search(r"^#\s*Description:\s*(.*?)$", script_code, re.MULTILINE)
            name_match = re.search(r"^#\s*Script Name:\s*(.*?)$", script_code, re.MULTILINE)
            tutorial_id_match = re.search(r"^#\s*TutorialID:\s*(.*?)$", script_code, re.MULTILINE)

            if description_match:
                script_description = description_match.group(1).strip()
            else:
                script_description = "No description provided."

            if name_match:
                script_name = name_match.group(1).strip()
            else:
                script_name = filepath.name

            if tutorial_id_match:
                script_tutorial = tutorial_id_match.group(1).strip()
            else:
                script_tutorial = ""

            # Create content dictionary with the desired order
            detail_content = "```powershell" + "\n".join(script_lines) + "```"
            content_dict = {
                "Title": script_name,
                "Description": script_description,
                "Tutorial": script_tutorial,
                "Details": detail_content
            }
            all_content.append(content_dict)

        except FileNotFoundError:
            print(f"File not found: {filepath.name}")
        except Exception as e:
            print(f"An unexpected error occurred while processing {filepath.name}: {e}")

    # Load the template YAML
    try:
        with open(dynamic_metadata_yaml_file, "r") as dynamic_file:
            data = yaml.safe_load(dynamic_file)
            new_yaml = data.copy()  # Create a copy of the template
    except yaml.YAMLError as e:
        print(f"Error parsing YAML file {dynamic_metadata_yaml_file}: {e}")
        return
    except FileNotFoundError:
        print(f"Template YAML file not found: {dynamic_metadata_yaml_file}")
        return

    # Add the generated content to the main YAML data
    new_yaml["Content"] = all_content

    # Construct the output file path within the designated directory
    output_filename = os.path.join(output_directory, "generated_script_documentation.yml")

    with open(output_filename, "w") as output_file:
        yaml.dump(new_yaml, output_file, indent=2, sort_keys=False, allow_unicode=True, default_flow_style=False)

        print(f"Documentation generated and saved to: {output_filename}")


# --- Main execution ---
if __name__ == "__main__":
    # Open current_dir.md to get the base path
    try:
        with open("current_dir.md", "r", encoding="utf-8-sig") as homeDirectory:
            basePath = next(homeDirectory).strip()  # Read the first line
    except FileNotFoundError:
        print("Error: current_dir.md not found.")
        exit()
    except StopIteration:
        print("Error: current_dir.md is empty.")
        exit()

    # Combine the basePath to create the full path to the template file
    dynamic_metadata_yaml_file = os.path.join(
        basePath,
        "My_Projects",
        "CoreFeetConcepts",
        "Implemented_Structures",
        "Activity",
        "script_dynamic_documentation_template.yml",
    )

    # Determine the output directory for generated files.
    output_directory = os.path.dirname(dynamic_metadata_yaml_file)

    # Directory where the scripts are located.
    directory_path = os.path.join(
        basePath,
        "My_Projects",
        "CoreFeetConcepts",
        "Implemented_Scripts",
        "Dir_Creation"
    )

    # Call the function to process files
    iterate_files(directory_path, dynamic_metadata_yaml_file, output_directory)
