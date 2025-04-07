---
FolderKey: "PROJECTS-COREFEET-SCRIPTS" # Unique key
---

# CoreFeetConcepts - Implemented_Scripts

CoreFeetConcepts is a tool designed to automate the categorization and linking of files and folders using YAML metadata. This README details the installation, usage, and workflow of the scripts within the `Implemented_Scripts` folder.

### File Path: My_Projects/CoreFeetConcepts/Implemented_Scripts/README.md
### Folder: My_Projects/CoreFeetConcepts/Implemented_Scripts
### TutorialID: CoreFeetConcepts-README-004

## Overview

The `Implemented_Scripts` folder houses the core scripts for managing your project's file structure, indexing, categorization, and metadata validation. These scripts are designed to work together in a specific workflow to ensure data integrity and maintainability. It's crucial to follow the steps outlined below in order for the system to work as intended.

**Important**: This folder (`Implemented_Scripts`) should be opened in Visual Studio Code to run the scripts.

## Workflow: Building and Validating Your File Tree

The workflow consists of several steps, each utilizing specific scripts. These steps must be followed sequentially to properly set up and maintain your project.

**Important Note:** The initial creation of `current_dir.md`, `master_index.md`, `user_index.md`, and `categorized_index.md` takes place in the **root `CoreFeetConcepts` folder**, *not* inside the `Implemented_Scripts` folder. After their creation, specific copies are then moved to their respective locations within the file tree.

### 1. Initial Directory Structure Creation

*   **`create_dir_directory_structure.ps1`**: This PowerShell script creates the initial directory structure for your project, laying out the basic file and folder hierarchy. This is your starting point. **To use this script, first copy it into the folder where you want to create the directory structure, then run it from within that folder.**
    * **Complementary Scripts**: Within the `Implemented_Scripts` folder, there is a `[`Dir_Creation`](Dir_Creation/)  subfolder containing additional PowerShell scripts. These scripts are designed to populate the directories created by `create_dir_directory_structure.ps1` with their subfolders, and a `README.md` inside each of them.
        * **Important Execution Change**: The scripts within `Dir_Creation` are not intended to be run from that folder. Instead, you must copy the desired script into the folder it is intended to modify and execute it from *within that folder*. For example, `create_books_subfolders.ps1` must be copied into the `Books` folder before running. The same process described above is to be used for these scripts.
        * **Language Subfolder Script Exception:** The `create_lang_directory_structure.ps1` script, located in `Dir_Creation`, is a special case. It is used to populate coding language subfolders and should be executed in the following three directories: `Tutorials/Coding`, `Interaction_Notes/Languages`, and `Definitions/Foundations_Of_Programming_Languages`. Copy the script to each of these directories before running it.

### 2. Setting the Base Path

*   **`set_base_directory.ps1`**: This PowerShell script facilitates the definition of the project's base path within the file system (e.g., C:/Users/YourName/Documents/CS_Knowledge_Base), subsequently stored in `current_dir.md`.  Subsequent scripts will reference this file to resolve the project's root context.
    *   **Manual Step:** Initiate the setup by creating a designated home directory for CoreFeetConcepts within your Documents folder; the default naming convention is CS_Knowledge_Base, but customization is permitted. Similarly, determine the desired name for your project folder, defaulting to CoreFeetConcepts. Crucially, open the `set_base_directory.ps1` script using a text editor or an integrated development environment such as Visual Studio Code. Examine the pre-defined variables `$rootPath`, `$homeDir`, and `$basePath`. Modify these values within the text editor to accurately reflect your intended root directory path, home directory location, and project folder name. Save the changes made to the script.
    *   **Important:** `current_dir.md` is initially created in the **`CoreFeetConcepts` folder** as a plain text data file containing a single path.. After creation, you must copy this file to the `Implemented_Scripts` folder. Then, set the file permissions of the copy in `Implemented_Scripts` folder to Read-only (using `Alt+Enter` on Windows or the file's properties). From this point on, scripts will reference this read-only copy of `current_dir.md` in `Implemented_Scripts` folder to determine the base path. The base path should not change after it is set.

### 3. Gathering All File Paths (Master Index)

*   **`create_master_index.ps1`**: This PowerShell script scans your entire project directory structure (defined by `current_dir.md`) and creates a comprehensive list of all file and folder paths. This list is saved to `master_index.md`. **Importantly, all paths in `master_index.md` are *relative* to the base path.** The base path is stripped from each entry, as it will be retrieved from `current_dir.md` when running other scripts.
    *   **Important:** `master_index.md` is initially created in the **`CoreFeetConcepts` folder**.

### 4. Defining Categorization Preferences (User Index)

*   **Manual Step:**
    1.  Copy the newly created `master_index.md` (from the `CoreFeetConcepts` folder).
    2.  Rename the copied file to `user_index.md`.
    3.  Open `user_index.md` (in the `CoreFeetConcepts` folder).
    4.  **Modify**: In `user_index.md`, delete any paths you *do not* want to categorize. Add any new paths if needed. This file represents your *personal* categorization preferences.
    *   **Important:** `user_index.md` is initially created in the **`CoreFeetConcepts` folder**. Each time you add a new folder or modify the file structure using File Explorer, you must re-run `create_master_index.ps1` to update the `master_index.md` file. After doing that, update `user_index.md` as needed.

### 5. Creating Categorized Index

*   **`create_unique_index_keys.py`**: This Python script reads your `user_index.md` (in the `CoreFeetConcepts` folder) and generates a `categorized_index.md` file. Each path in `user_index.md` is assigned a unique key, which will be used in your YAML files to categorize them.
    *   **Important:** `categorized_index.md` is initially created in the **`CoreFeetConcepts` folder**.

### 6. Maintaining Categorized Index

*   **`update_index_keys.py`**: This Python script is used to keep `categorized_index.md` up-to-date with changes in `user_index.md`. When you add, remove, or change entries in `user_index.md`, run this script to update `categorized_index.md` accordingly. It sorts entries in `categorized_index.md` and logs all changes made to `CS_Knowledge_Base/command_log.md`.
    * This script is run from the `Implemented_Scripts` folder as it will need to access the path where the log file is.

### 7. Final System Configuration for Scripts

*   **Manual Steps (Crucial!)**
    1.  **Copy `current_dir.md` into the `Implemented_Scripts` folder.** This provides the base path for all scripts.
    2.  **Change the access permissions of `current_dir.md` (in `Implemented_Scripts`) to Read-only** (`Alt+Enter` on Windows, or using the properties dialog).
    3.  **Copy `master_index.md` and `categorized_index.md` (from the `CoreFeetConcepts` folder) into the `Implemented_Structures` folder.** These are the core reference files for your scripts to validate against.
    4.  **Change the access permissions of both `master_index.md` and `categorized_index.md` (in `Implemented_Structures`) to Read-only** (`Alt+Enter` on Windows).
    5.  **Important** The `Implemented_Structures/Activity` folder will contain all the YAML files that will contain relative paths that will be compared with `master_index.md` and will also contain Category keys that are matched against `categorized_index.md`. These files will need to be copied into this folder. You can copy the `metadata_template_core_data.yml` as many times as you want and rename each document before you fill it in.

### 8. YAML Metadata Validation (The Core Check)

*   **`validate_yaml_indexes.ps1`**: This PowerShell script is the most critical script in the system. It validates the YAML files in the `Implemented_Structures/Activity` folder against the `master_index.md` and `categorized_index.md` files. This script ensures data integrity and correct association between files, paths, and categories. It performs the following checks:
    *   **File Name Matching:** Ensures the `FileName` field in each YAML file accurately matches the actual file name.
    *   **File Path Existence:** Checks that the `FilePath` field in each YAML file exists as a relative path within `master_index.md`.
    *   **Category Validation:** Verifies that the `Category` keys in each YAML file are valid keys present in `categorized_index.md`.
    *   **Mandatory Validation Step**: You must run this script before committing your changes to your project. This is the last step of your process and should be used to double check your work, as it is the most important script.

### 9. Organizing YAML File Metadata

* **`organize_yaml_files.ps1`**: Script automates the organization of YAML files in the Activity folder. It reads each file, verifies the 'FilePath' entry, and if valid, moves the file to the location indicated by 'FilePath'.

### 10. Searching YAML Files for Specific Criteria

* **`search_yaml_keys.py`**: This Python script searches all YAML files within the project's directory tree for specific categories, keywords, or related content. It reads the base path from `current_dir.md` to navigate the file system. The script can search for specific keys and their associated values within YAML files, including searching within nested list structures.
    * **Important Considerations:**
        * **Specificity of Searches:** The script returns files that match *all* provided search criteria. If a file matches the specified values for the searched keys, it will be included in the results, even if it contains other keys with different values. Users should provide specific search criteria to narrow down results.
        * **Case Sensitivity:** Key and value searches are case-sensitive. Searching for "Document" will not match "document," and searching for "File" will not match "file." Ensure that the search criteria match the exact casing used in the YAML files.
    * Matching YAML files are copied to the `My_Projects/CoreFeetConcepts/Implemented_Structures/Event` folder. If a file with the same name already exists in the `Event` folder, a counter (1, 2, etc.) is appended to the filename to avoid collisions.
    * **Usage:**
        1.  Ensure `current_dir.md` exists in the same directory as the script, containing the base path to the project.
        2.  Open the `search_yaml_keys.py` script and navigate to the `if __name__ == "__main__":` block, specifically after line 144.
        3.  Configure the search criteria variables within the region marked `# startregion Criteria searches` and `# endregion`.
        4.  Run the script from the command line: `python search_yaml_keys.py`.
        5.  The script will print the results of the search.
        6.  YAML files with matching criteria will be copied to the `Event` folder, with collision handling as described above.
    * **No Results Handling:**
        * The script will only output nothing if no files match the search criteria.
        
#### `manage_readme_folderkey.ps1` (PowerShell)
**Description:** This script provides an *optional* way to manage "FolderKey" metadata in `README.md` files. It reads a key-value mapping from the `folder_key_index.md` file and updates or creates `README.md` files with the "FolderKey" metadata section. Users can utilize this to automate the process. The `My_Projects/CoreFeetConcepts` folder and its subfolders are excluded.

## Utility Scripts

#### `rename_remove_parentheses.ps1` (PowerShell)
**Description**: Removes parentheses with numbers (e.g., (1), (2)) from filenames in the Activity directory and normalizes hyphens and whitespace.

#### `rename_files_with_underscores.ps1` (PowerShell)
**Description**: Replaces spaces in filenames with underscores in the Activity directory, starting from a base path read from `current_dir.md`.

#### `log_message.ps1` (PowerShell)
**Description**: Logs messages to `command_log.md` with timestamp and message type, and displays the log entry to the console.

#### `log_message.py` (Python)
**Description**: Logs messages with a timestamp and type to a log file, intended to be imported and used by other scripts.

#### `check_path_length.ps1` (PowerShell)
**Description**: Verifies that file paths are within the Windows limit of 248 characters and logs an error message if exceeded. When using this script, make sure to import the `log_message.ps1` file as it contains the `Log-Message` function required by this script.

#### `copy_metadata_template.ps1` (PowerShell)
**Description**: Copies `metadata_template_core_data.yml` from the `Metadata_Templates` folder to the Activity directory and logs the file copy operation.

#### `dynamic_script_documentation.py` (Python)
**Description:** This optional utility script generates a documentation YAML file (`generated_script_documentation.yml`) within the `Activity` folder. It uses the template file (`script_dynamic_documentation_template.yml`) located in the same `Activity` folder and extracts metadata from scripts found in the `Dir_Creation` folder. It reads the base path from `current_dir.md`. Users can configure the input template file name and the output file name by modifying the script; otherwise, it uses the default files within the `Activity` folder.

#### `generate_html_from_yaml.py` (Python)
**Description:** This utility script transforms a YAML file (`generated_script_documentation.yml`) into an HTML document (`script_documentation.html`). It is configured to use these specific file names by default. It must be located in the same folder as `generated_script_documentation.yml` to work correctly. Users should review this script to change the input YAML file name or output HTML file name if needed.
**How to run:** To use this script, copy it to the `Activity` folder (where `generated_script_documentation.yml` is located). Then, run it from within that folder.
* **Note:** By creating a HTML template that you can configure inside the `generate_html_from_yaml.py` script with CSS, you can manage line breaks when converting to PDF. It also makes the HTML page dynamic when changing the screen as the lines of text do wrap around.

#### `generate_pdf_from_html.py` (Python)
**Description:** This utility script converts an HTML file to a PDF file. It is designed to convert `script_documentation.html` to `script_documentation.pdf` that are both located in the `Activity` folder. The script needs to be copied into the same folder where `script_documentation.html` is located. Users can modify the script to change the name of the input html file or output pdf file.
**How to run:** To use this script, copy it to the `Activity` folder (where `script_documentation.html` is located). Then, run it from within that folder.

#### `list_files_and_folders.ps1` (PowerShell)
**Description**: Retrieves and writes the names of all files and folders in the current directory to `CurrentList.md`.
**How to Run:** To list the contents of a specific folder, first copy `list_files_and_folders.ps1` into that folder. Then, right-click the script and select "Run with PowerShell".

#### `rename_activity_files_folderkey.ps1` (PowerShell)
**Description**:  Processes YAML files, extracts folder paths from the FilePath metadata, and renames the files according to the name of the folder they are to be stored in or the FolderKey metadata found in the README of the corresponding folder.

#### `rename_files_readme_key.py` (Python)
**Description:** This script renames files in a target directory by appending the "FolderKey" from each folder's README.md or it will append the folder's name. It uses log_message() to log events to command_log.md, which is located in the basePath defined in current_dir.md.
**How to Run:**
1.  Open the script file.
2.  Locate the `usersTargetDirectory` variable. It is defined within the `if __name__ == "__main__":` block as:

    ```python
    usersTargetDirectory = "target_directory"
    ```
3.  Modify the value of `usersTargetDirectory` to the relative path of the directory you want to rename files in.
    * For example, if you want to rename files in a subdirectory called "target_directory" located in the "My_Projects/CoreFeetConceptss" folder, change it to:

        ```python
        usersTargetDirectory = "My_Projects/CoreFeetConceptss/target_directory"
        ```
4.  Save the script.
5.  Run the script from the command line. The `command_log.md` file will be created in the directory defined by the `log_directory` variable, which is the same directory as the script.

## Folders

This section describes the subfolders within the `Implemented_Scripts` directory.

*   **Dir_Creation**: This folder contains a collection of PowerShell scripts designed to create subfolder structures for specific areas within the project. Each script within `Dir_Creation` is named according to the folder it is intended to populate (e.g., `create_definitions_directory_structure.ps1` is for the `Definitions` folder). These scripts are designed to be copied into their target folder and executed from within that location to generate the necessary subdirectories. The `Dir_Creation` folder currently focuses on establishing a foundational file tree structure tailored for a Computer Science student's studying and working needs.

Future subfolders within `Implemented_Scripts` will serve two primary purposes:

1.  **Task-Specific Functionality**: Some new folders will contain scripts dedicated to managing specific software functionalities, such as tools for a GUI application.
2.  **Suggested Academic File Trees**: Following the pattern of `Dir_Creation`, new folders (e.g., `Math_Creation`) may be added to house scripts that generate file tree structures tailored to different academic disciplines based on user suggestions.

### Data Management: Saving Project States

*   When you are satisfied with the current state of your project (file structure, categorization, etc.), you can save the current state by:
    1.  Copying `master_index.md`, `user_index.md`, and `categorized_index.md` (from the `CoreFeetConcepts` folder) to a location within the root directory of `CoreFeetConcepts`.
    2.  Renaming them to indicate the date of the state (e.g., `master_index_feb_02_2025.md`, `user_index_feb_02_2025.md`, `categorized_index_feb_02_2025.md`).
    3. These files are stored in the root directory of `CoreFeetConcepts` to save old data states.
*   This allows you to revert to older states if needed. Remember that the scripts in `Implemented_Scripts` *always* read from the **copies** of `master_index.md` and `categorized_index.md` located in `Implemented_Structures`.

### Data Management: Tracking Metadata Values
To ensure the consistency, maintainability, and readability of your metadata, it's essential to follow these data management practices:

* **Category and Keyword Tracking:**
    * Maintain two separate Markdown files to track previously used Category and Keyword values: `previously_used_categories.md` and `previously_used_keywords.md`.
    * Store these files in the root directory of the `CoreFeetConcepts` project folder.
    * This practice helps to standardize the values used for categorization and searching.
* **Value Capitalization:**
    * Ensure that all Category and Keyword values are consistently capitalized.
    * This improves readability and helps avoid inconsistencies caused by variations in case.
* **File Maintenance**
    * When adding new Category or Keyword values:
        1.  Review the original `previously_used_categories.md` or `previously_used_keywords.md` file located in the `CoreFeetConcepts` directory.
        2.  Make the necessary changes (additions) to this file.
        3.  Copy the updated file into the `CoreFeetConcepts/Implemented_Structures/Activity` folder.
        4.  Set the file permissions of the copied file in the `Activity` folder to Read-only. This prevents accidental deletion or alteration of the data.
* **Rationale:**
    * While project state headlines might be project-specific, consistent Category and Keyword values are crucial for overall data management and searchability across projects.
    * Enforcing capitalization and tracking values ensures consistency and avoids redundancy.
    * Storing a read-only copy in the `Activity` folder provides a readily accessible reference for scripts and users working with metadata in that directory, while protecting the data from unintended changes.
    * Changes should be made to the original file to maintain a master list of keywords and categories.

## Additional Recommendations

*   Logging each script's output to a `command.log` file can be very useful for tracking and automation. Review `log_function_powershell.ps1` and `copy_templates_activity.ps1` for ideas on how to extend this logging functionality.
*   Proper file naming conventions (e.g., lowercase for web deployment) and file access permissions are crucial for data integrity and security.
*   You can create more utility scripts, like one to automatically copy and set permissions for `master_index.md` and `categorized_index.md` into `Implemented_Structures`.

## Troubleshooting

*   Many scripts and functions have limited error handling. You, as the software engineer, are responsible for debugging and fixing issues.
*   A common area for errors is in path validation and file existence checks. Be sure to thoroughly test your modifications.

## Technical Notes

### YAML Multi-line String Handling

During development, an issue was encountered with the `yaml.dump()` function, where multi-line strings were being incorrectly converted to single-line strings. This behavior was traced to the default string representation using `>`.

The solution was to explicitly specify the `|` representer when using `yaml.dump()`. This is particularly relevant when working with the `dynamic_script_documentation.py` script.






