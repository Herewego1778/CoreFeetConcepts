# Description: This script renames files in a target directory by appending the FolderKey metadata from each folder's README.md.
#              It uses log_message() to log events to command_log.md, which is located in the basePath defined in current_dir.md.
#              The target directory is specified in the rename_files_with_folder_key() function call at the end of the script.

# Script Name: rename_files_readme_key.py
# TutorialID: "TUT-PS-SCRIPT-001"

import os
import yaml
from log_message import log_message

# Derive the keys from the folder names themselves. For example, you could use the last part of the folder path
def get_folder_key(folder_path):
    folder_name = os.path.basename(folder_path)  # Get the last part of the path
    # Derive a key based on the first 4 characters of the folder's name using the slice function
    key = folder_name[:4].lower() # replace slashes with hyphens, and lowercase
    return key

# Derive the keys from the FolderKey metadata stored in each README.md
# log_directory is the file path to command_log.md which the log_message() demands as a parameter
def rename_files_with_folder_key(root_dir, log_directory=None):
    # Initiliaze counters to zero
    files_renamed_count = 0
    files_skipped_count = 0
    # Create a array with os.walk(root_dir) and iterate through
    for folder_path, _, filenames in os.walk(root_dir):
        # Only process folders with files
        if filenames:
            # Get the folder key (from YAML or filename)
            readme_path = os.path.join(folder_path, "README.md")
            # Set to Null
            folder_key = None

            # If the path exists, try to open the README.md in the current folder being accessed
            if os.path.exists(readme_path):
                try:
                    with open(readme_path, 'r') as readme_file:
                        content = readme_file.read()
                        # Each README begins with the YAML Document Seperator '---'
                        if content.startswith('---'):
                            # Split the rest of file from the YAML Document Seperator
                            yaml_data = yaml.safe_load(content.split('---')[1])
                            # Retrieve and store the FolderKey
                            folder_key = yaml_data.get('FolderKey')
                except Exception as e:
                    print(f"Error reading README.md in {folder_path}: {e}")

            # If no FolderKey was retrieved and stored, then the function get_folder_key() at line 10 creates a key
            if not folder_key:
                folder_key = get_folder_key(folder_path) # Get the folder key from the path

            # Iterate through each file stored inside the filenames array
            for filename in filenames:
                if filename != "README.md": # Skip README files
                    file_path = os.path.join(folder_path, filename) # Join the folder path and file name
                    name, ext = os.path.splitext(filename) # Store the file name and file extension seperately using the filename var
                    
                    # Check if the folder key is already in the filename
                    if f"_{folder_key}" in name:
                        files_skipped_count += 1 # Increment the counter by one for each file skipped
                        continue  # Skip to the next file
                    
                    # Extract last four characters, exclude hyphens, and lowercase
                    last_four = "".join(char for char in folder_key if char != "-")[-4:].lower()
                    new_filename = f"{name}_{last_four}{ext}" # Format the new file name with the folder key prior to the file extension
                    new_file_path = os.path.join(folder_path, new_filename) # Join the current folder path to the new formatted file name

                    # With the new file path, now rename the current file by using the old file path to the new file path
                    try:
                        os.rename(file_path, new_file_path)
                        print(f"Renamed: {filename} -> {new_filename}")
                        files_renamed_count += 1 # Increment the counter by one for each file renamed
                        # Log an error record to command_log.md (or user-defined log)
                        log_message(f"Renamed: {filename} -> {new_filename}", "Python", log_directory) 
                    except Exception as e:
                        print(f"Error renaming {filename}: {e}")
                        # Log an error record to command_log.md (or user-defined log)
                        log_message(f"Error renaming: {filename} -> {new_filename}", "Python", log_directory) 
    if files_renamed_count > 0:
        print(f"Finished executing the script. {files_renamed_count} file(s) were renamed.")
    elif files_skipped_count > 0:
        print(f"Finished executing the script. No files were renamed, all file(s) already had the folder key.")
    else:
        print("Finished executing the script. No file(s) were renamed or needed renaming.")

if __name__ == "__main__":
    # This script utilizes the log_message function and requires the file path to command_log.md.
    # The user can override the default log file location. The log_message function will look for 'command_log.md' in the directory specified by the 'log_directory' variable.

    # Read the base path from current_dir.md. This path is used to locate command_log.md and as a base for the target directory.
    try:
        with open("current_dir.md", "r", encoding="utf-8-sig") as homeDirectory:
            basePath = next(homeDirectory).strip()  # Read the first line (base path)
            log_directory = basePath  # Set log_directory to the base path (default)
    except FileNotFoundError:
        print("Error: current_dir.md not found.")
        exit() # Exit the script
    except StopIteration:
        print("Error: current_dir.md is empty.")
        exit() # Exit the script

    # User's preferred target directory (relative path).
    # This relative path must be configured to specify the directory where files will be renamed.
    usersTargetDirectory = "target_directory"  # Example: "My_Projects/Subfolder"

    # Construct the full target directory path by joining the base path and the user's relative path.
    targetDirectory = os.path.join(basePath, usersTargetDirectory)

    # Check if targetDirectory exists
    if not os.path.exists(targetDirectory):
        print(f"Error: Target directory '{targetDirectory}' does not exist.")
        exit() # Exit the script

    # Rename files in the specified target directory, using the log_directory as the base path for command_log.md.
    rename_files_with_folder_key(targetDirectory, log_directory)