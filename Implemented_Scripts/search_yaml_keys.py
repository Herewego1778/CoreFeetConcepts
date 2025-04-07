# Description: This Python script searches each YAML file in the entire file tree for specific categories, keywords, or related content.
# Script Name: search_yaml_keys.py
# TutorialID:

import os
import yaml
import shutil

# This reads the entire directory given to it
def read_yaml_files(directory, skip_dir=None):
    yaml_data = {}
    for root, _, files in os.walk(directory):
        # Check if the current directory should be skipped
        if skip_dir and root == skip_dir:
            continue  # Skip to the next directory
        for file in files:
            if file.endswith(('.yaml', '.yml')):
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as f:
                    try:
                        yaml_data[file_path] = yaml.safe_load(f)
                    except yaml.YAMLError as e:
                        print(f"Error reading YAML file {file_path}: {e}")
    return yaml_data



def search_yaml(file_path, category_values=None, keyword_values=None, resource_type=None, media_type=None, language=None, used_in_experience=None, related_content=None, related_ordinance=None, related_tutorials=None, related_definitions=None):
    """
    Searches for specific values in the specified keys of a YAML file.
    All provided values must be present in the respective keys for a match.
    """
    try:
        with open(file_path, 'r') as file:
            data = yaml.safe_load(file)
    except FileNotFoundError:
        return "File not found."
    except yaml.YAMLError as e:
        return f"YAML parsing error: {e}"

    # Check for key existence and return None if missing but values provided
    if "Category" not in data and category_values is not None:
        return None
    if "Keywords" not in data and keyword_values is not None:
        return None
    if "ResourceType" not in data and resource_type is not None:
        return None
    if "MediaType" not in data and media_type is not None:
        return None
    if "Language" not in data and language is not None:
        return None
    if "UsedInExperience" not in data and used_in_experience is not None:
        return None
    if "RelatedContent" not in data and related_content is not None:
        return None
    if "RelatedOrdinance" not in data and related_ordinance is not None:
        return None
    if "RelatedTutorials" not in data and related_tutorials is not None:
        return None
    if "RelatedDefinitions" not in data and related_definitions is not None:
        return None

    results = {}

    # Check for values and add to results if found
    if category_values is not None:
        yaml_categories = data.get("Category", [])
        for value in category_values:
            if value not in yaml_categories:
                return None
        results["Category"] = yaml_categories

    if keyword_values is not None:
        yaml_keywords = data.get("Keywords", [])
        for value in keyword_values:
            if value not in yaml_keywords:
                return None
        results["Keywords"] = yaml_keywords

    if resource_type is not None:
        if data.get("ResourceType") != resource_type:
            return None
        results["ResourceType"] = data.get("ResourceType")

    if media_type is not None:
        if data.get("MediaType") != media_type:
            return None
        results["MediaType"] = data.get("MediaType")

    if language is not None:
        if data.get("Language") != language:
            return None
        results["Language"] = data.get("Language")

    if used_in_experience is not None:
        if data.get("UsedInExperience") != used_in_experience:
            return None
        results["UsedInExperience"] = data.get("UsedInExperience")

    if related_content is not None:
        yaml_related_content = data.get("RelatedContent", [])
        for value in related_content:
            if value not in yaml_related_content:
                return None
        results["RelatedContent"] = yaml_related_content

    if related_ordinance is not None:
        if data.get("RelatedOrdinance") != related_ordinance:
            return None
        results["RelatedOrdinance"] = data.get("RelatedOrdinance")

    if related_tutorials is not None:
        if data.get("RelatedTutorials") != related_tutorials:
            return None
        results["RelatedTutorials"] = data.get("RelatedTutorials")

    if related_definitions is not None:
        yaml_related_definitions = data.get("RelatedDefinitions", [])
        for value in related_definitions:
            if value not in yaml_related_definitions:
                return None
        results["RelatedDefinitions"] = yaml_related_definitions

    if results:
        return results
    else:
        return None

if __name__ == "__main__":
    # Open current_dir.md inside the current folder to combine paths with the command_log.md
    try:
        with open("current_dir.md", "r", encoding="utf-8-sig") as homeDirectory:
            basePath = next(homeDirectory).strip()  # Read the first line
            if not basePath:  # Check if the stripped string is empty
                print("Error: current_dir.md contains only whitespace or is empty.")
                exit()  # Exit the script
    except FileNotFoundError:
        print("Error: current_dir.md not found.")
        exit()
    except StopIteration:
        print("Error: current_dir.md is empty.")
        exit()

    # Validate basePath *after* attempting to read it
    if not os.path.isdir(basePath):
        print(f"Error: Base path '{basePath}' is not a valid directory. Review current_dir.md and try again.")
        exit()  # Terminate the script if basePath is invalid

    # Joins the base path to the CoreFeetConcepts\Implemented_Structures\Event folder or returns a error
    event_dir = os.path.join(basePath, 'My_Projects', 'CoreFeetConcepts', 'Implemented_Structures', 'Event')
    if not os.path.exists(event_dir):
        print(f"Error: Event directory '{event_dir}' does not exist. Create the folder and try again.")
        exit()
        
    # This reads the entire directory of basePath and stores it in a variable
    yaml_files_data = read_yaml_files(basePath, event_dir)

    # Define your search criteria. Review 'metadata_template_core_data.yml' for key suggestions.
    # Each variable corresponds to a specific key in the YAML files.
    # If you don't want to search for a key, leave its variable as None.
    
    # startregion Criteria searches
    category_search = None # ["act", "impa"] # Values to search for in the 'Category' list.
    keyword_search = ["Python", "File"] # ["File Manipulation", "OS (Operating System)", "Database"] # Values to search for in the 'Keywords' list.
    resource_type_search = None # "Documentation" # Value to search for in 'ResourceType'.
    media_type_search = None # "code" # Value to search for in 'MediaType'.
    language_search = None # "Python" # Value to search for in 'Language'.
    used_in_experience_search = None # "Project A" # Value to search for in 'UsedInExperience'.
    related_content_search = None # ["subscriptions/aws_subscription.yml", "buildings/building_a.yml"] # Values to search for in 'RelatedContent' list.
    related_ordinance_search = None # "Ordinance 123" # Value to search for in 'RelatedOrdinance'.
    related_tutorials_search = None # "TUT-PYTHON-LINSPACE-01" # Value to search for in 'RelatedTutorials'.
    related_definitions_search = None # ["linspace()_python.md", "library_numpy_python.md"] # Values to search for in 'RelatedDefinitions' list.
    # endregion Criteria searches

    for file_path, data in yaml_files_data.items():
        # Call the search_yaml function
        results = search_yaml(
            file_path,
            category_search,
            keyword_search,
            resource_type_search,
            media_type_search,
            language_search,
            used_in_experience_search,
            related_content_search,
            related_ordinance_search,
            related_tutorials_search,
            related_definitions_search,
        )

        # Check the results and copy if found
        if results is not None:
            print(f"All values were found in {file_path}:")
            print(results)

            # Handle potential name collisions
            base_filename = os.path.basename(file_path)
            dest_file_path = os.path.join(event_dir, base_filename)
            counter = 1

            while os.path.exists(dest_file_path):
                filename, ext = os.path.splitext(base_filename)
                dest_file_path = os.path.join(event_dir, f"{filename} ({counter}){ext}")
                counter += 1

            shutil.copy2(file_path, dest_file_path)
            print(f"Copied {file_path} to {dest_file_path}")
