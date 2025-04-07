---
FolderKey: "PROJECTS-COREFEET" # Unique key
---
### File Path: My_Projects\CoreFeetConcepts\README.md
### Folder: My_Projects\CoreFeetConcepts
### TutorialID: CoreFeetConcepts-README-001

# CoreFeetConcepts

[Project File Tree Sitemap](sitemap_flowchart.jpg) - This flowchart provides an overview of the complete file tree for this project.  The main directories are listed on the left, and their subfolders are shown in tables to the right.  This GitHub repository contains the `CoreFeetConcepts` subfolder (within the `My_Projects` directory) and associated scripts.

**Note:** The  "On_Location," "Online_Courses," "Public_Portfolio" and "Hybrid_Remote" directories are shown but their subfolders have been omitted as they contain one or two subfolders and their names are self-explanatory.

[Watch the introductory video on YouTube](https://youtu.be/MnUSqctm5Mc)

[Visit the project's website](https://corefeetconcepts.web.app)

[CoreFeetConcepts Workflow](CoreFeetConcepts_workflow.png)

This image displays the typical workflow within CoreFeetConcepts: Visual Studio Code with the Implemented_Scripts folder and Terminal open, the Activity and Event folder showing YAML files being worked on, and Notepad displaying category keys and folder paths for reference. The yellow highlight bar shows the user the tab selection. This setup allows for efficient data documentation, validation, and file management. The Event folder is an essential tab that should be kept open as search results from YAML keys will be copied and moved to the Event folder.

## Project Versioning and State Saving

To preserve specific project states, you can save copies of the following:

* **CoreFeetConcepts Folder:** Copy the entire `CoreFeetConcepts` folder and rename it with a date or version identifier (e.g., `CoreFeetConcepts_feb_01_2025` or `CoreFeetConcepts_v1.0`).
* **CS_Knowledge_Base Folder:** Copy your entire `CS_Knowledge_Base` file tree and rename it with a date or version identifier (e.g., `CS_Knowledge_Base_feb_01_2025` or `CS_Knowledge_Base_v1.0`).
* **Index Files:** As described in the `Implemented_Scripts/README.md`, you can also save individual copies of `master_index.md`, `user_index.md`, and `categorized_index.md` with date or version identifiers.

This allows you to revert to previous project states if needed.

## Version Number

#### Version Number: 1
The current version of CoreFeetConcepts is:  **1**
**Initial Release Date:** 2025-03-24
You can find the version number in the home GitHub repository for CoreFeetConcepts

## Common Commands

* `Ctrl+C`: Copy selected text or files.
* `Ctrl+V`: Paste copied text or files.
* `Alt+Enter`: View or modify file permissions (read-only, etc.).
* `Right-click > Run PowerShell`: Open a PowerShell console in the current directory.
    * **Note:** On Windows 11 and 10, you might be prompted to allow PowerShell to run scripts. 
* `Ctrl+S`: Save the current file.
* `F2`: Rename the selected file or folder.
* `Ctrl+A`: Select all text or files in the current view.
* `Ctrl+F2` (Visual Studio Code): Select all occurrences of the currently selected word or text for simultaneous editing. Essential for renaming variables or recurring folder names across multiple lines.
* `Ctrl+Z`: Undo the last action (available in many applications, including Visual Studio Code and File Explorer).
* `Ctrl+Y`: Redo the last undone action (available in many applications, including Visual Studio Code and File Explorer).
* `Delete` or `Del`: Delete the selected file or folder.
* `Ctrl+-`: For zooming out of the screen.
* `Ctrl++`: For zooming in on the screen.

## PowerShell Permissions

On Windows 11 and 10, you might encounter permission prompts when running PowerShell scripts, both in the Terminal and via the right-click "Run PowerShell" option. You may need to adjust your PowerShell execution policy to allow scripts to run.

**To adjust the execution policy:**

1. Open PowerShell as an administrator.
2. Run the command `Set-ExecutionPolicy RemoteSigned`.
3. Confirm the change by typing `Y` and pressing Enter.

**Note:** Be cautious when changing execution policies, as allowing unrestricted script execution can pose security risks. Only change the policy if you understand the potential implications.

## Prerequisites

To use CoreFeetConcepts effectively, ensure you have the following software and libraries installed. It is also recommended for use on a Windows 11 / 10 system:

* **YAML:** Familiarity with YAML syntax is essential for creating and managing metadata files.
* **Python:**
    * Python 3.x: Python is required for running the Python scripts. You can download it from [python.org](https://www.python.org/).
    * Python Libraries:
        * `re`: For regular expression pattern matching.
        * `os`: For operating system interactions, including file path retrieval and joining.
        * `shutil`: This Python library is used for high-level file operations, such as copying files.
        * Install the following Python packages using pip:
        ```bash
        pip install pyyaml jinja2 xhtml2pdf 
        ```
        * `PyYAML`: Required for parsing and generating YAML files.
        * `Jinja2`: Used for creating HTML files, which helps prevent encoding errors.
        * `xhtml2pdf`: Used for converting HTML files to PDF. While its primary use here is PDF conversion, it has broader capabilities.
* **PowerShell:**
    * PowerShell for Windows 11/10 (or later) installed.
    * PowerShell Modules:
        * `PowerShellYAML`: Required for working with YAML files. Install using: `Install-Module -Name PowerShellYAML`
    * **To install all PowerShell modules, you can copy and paste the following commands:**
        ```PowerShell
        Install-Module -Name powershell-yaml
        ```
* **Visual Studio Code (Recommended):** While not strictly required, Visual Studio Code is highly recommended for editing scripts and YAML files.
* **Understanding of Syntax:** Users should have a basic understanding of PowerShell, YAML, and Python syntax.
* **Supported File Formats:** The scripts are designed to handle files with these extensions to extract and validate metadata.
    * YAML: `.yml`, `.yaml` 

**Note:** While each of the mentioned libraries and tools has broader uses, these prerequisites and standard libraries are essential for the core functionality of CoreFeetConcepts's scripts.

## Getting Started

1.  **Download the Repository:**
    * Download the CoreFeetConcepts repository as a ZIP file from GitHub and extract it to your desired local directory.
    * Alternatively, use Git to clone the repository: `git clone https://github.com/Herewego1778/CoreFeetConcepts.git`.

2.  **Run `create_dir_directory_structure.ps1`:**
    * Open your terminal or command prompt.
    * Navigate to the `Implemented_Scripts` folder within the extracted repository.
    * Execute the `create_dir_directory_structure.ps1` script. This creates the base project directory structure, including the `My_Projects` folder.

3.  **Copy Scripts to Corresponding Folders:**
    * Inside the `Implemented_Scripts/Dir_Creation` folder, locate the additional scripts.
    * Copy each script to the folder it's named after (which was created in the previous step).
        * For example: Copy `create_definitions_directory_structure.ps1` to the `Definitions` folder.

4.  **Rename and Move to `My_Projects`:**
    * Rename the extracted repository folder to `CoreFeetConcepts`.
    * Move the renamed `CoreFeetConcepts` folder into the `My_Projects` folder (created by the `create_dir_directory_structure.ps1` script).

5.  **Run `set_base_directory.ps1`:**
    * After moving the `CoreFeetConcepts` folder, run the `set_base_directory.ps1` script. This script configures the base path for your CoreFeetConcepts project.

6.  **Refer to `Implemented_Scripts/README.md`:**
    * For detailed instructions on using the remaining scripts in the `Implemented_Scripts` folder, consult the `Implemented_Scripts/README.md` file. [Link to Implemented Scripts README](Implemented_Scripts/README.md)

7.  **Install Prerequisites:**
    * Ensure that you have installed all the necessary software and libraries listed in the "Prerequisites" section.

8.  **Customize and Extend:**
    * Adapt the scripts and file structure to suit your specific needs and workflows.

9.  **Uninstall:**
    * To uninstall CoreFeetConcepts, simply delete the `CoreFeetConcepts` folder and the original ZIP file.

## Introduction

CoreFeetConcepts is a comprehensive knowledge management system designed to streamline the organization, retrieval, and documentation of information. It empowers users to build and maintain a structured knowledge base through automated directory creation, **dynamic HTML and PDF content generation**, YAML metadata management, and robust indexing capabilities. This project provides scripts for building the directory structure, managing files, and creating dynamic YAML metadata. CoreFeetConcepts repository contains the scripts and structures specifically for automating file organization and metadata management within an existing CS_Knowledge_Base directory structure.  By implementing CoreFeetConcepts, users gain practical experience in software development principles, including system design, data modeling, and automation.

This software is designed to be used via the Terminal, Console, or GUI, offering a hands-on approach to understanding modern computer systems. Users will learn to navigate file systems, manage permissions (e.g., using Alt+Enter for read-only access), and grasp the underlying processes of operating system setup. From BIOS initialization to the creation of utilities and graphical interfaces, users will experience and continue the software development cycle. This project emphasizes the creation of structured file hierarchies, a crucial skill for any software developer, especially those working on web projects that require organized image and asset management.

## Usage

To use CoreFeetConcepts, begin by creating the initial directory structure, setting the base path, and then utilizing the provided scripts to manage your files and metadata. The Implemented_Scripts/README.md file provides detailed instructions for each step.

### Metadata Considerations

When working with files, it's crucial to understand the difference between embedded metadata and the metadata managed by CoreFeetConcepts.

* **Embedded Metadata:** Many file types (e.g., images, documents) can store metadata within the file itself. This might include information like creation date, author, or camera settings.
* **CoreFeetConcepts YAML Metadata:** CoreFeetConcepts uses YAML files to store and manage metadata *separately* from the files. This approach offers:
    * Centralized control over metadata.
    * The ability to add custom, project-specific information.
    * Enhanced search and retrieval capabilities.

For optimal file management, consider both embedded metadata and the structured metadata you create using CoreFeetConcepts. For more details on the structure and usage of the CoreFeetConcepts metadata templates, see the [Metadata Templates README](Metadata_Templates/README.md).

## Naming Conventions

To ensure compatibility and prevent errors, especially in network environments, CoreFeetConcepts adheres to the following naming conventions:

* **Folders:** Use uppercase for each word, separated by underscores (e.g., `My_New_Folder`).
* **Files:** Use lowercase for each word, separated by underscores, with appropriate file extensions (e.g., `my_new_file.txt`).

## Design Philosophy

CoreFeetConcepts leverages YAML for metadata management, embracing existing, widely-used formats to enhance functionality and compatibility. Similarly, Python is employed for it's free, open-source nature and robust capabilities.

The project highlights the relationship between tools like Python and PowerShell, demonstrating how the latter builds upon the foundational utilities of the Terminal, Console, and operating system. It also sheds light on the machine-generated file identifiers used by computers for internal organization. For example, instead of human-readable names like `my_document.txt`, operating systems often use identifiers such as `a3f82d90-4b1a-46c5-9e07-7a2c1b3f6e89.dat`. Understanding this distinction is crucial for developers who need to create software that interfaces with both human users and machine-level systems, especially in scenarios involving database management or file retrieval.

To enhance long-term storage and maintainability, CoreFeetConcepts employs TutorialIDs and FolderKeys.

* **TutorialIDs:** Each script in this project and future projects is assigned a unique TutorialID. This provides a standardized way to reference and manage scripts, making them easier to identify than relying solely on file names and folder paths.
* **FolderKeys:** Each README file in the file tree is automatically assigned a unique FolderKey using a script that reads `folder_key_index.md`. This key is placed in the YAML-like header of the README (e.g., `FolderKey: "PROJECTS-COREFEET"`).

These keys are optional but highly recommended for projects that require long-term storage and retrieval.

**Note:** Category keys, used in YAML files and other data-related files, are distinct from FolderKeys and serve to link the search and filter system. YAML files utilize a "Category" key that contains category keys, keyword keys, and other relevant keys to further categorize documents. The relative paths of these documents are indexed alongside their category keys in `categorized_index.md`. A separate file, `previously_used_keywords.md`, is maintained to track commonly used keywords.

### Programming Language Choices

* **PowerShell:**
    * Shell scripting language preinstalled on Windows.
    * Friendly to users in the digital divide era.
    * Used for system administration and file management tasks.
* **Python:**
    * Cross-platform, widely accepted language.
    * Used for tasks requiring more complex logic and data manipulation.
    * Accessible to a broad audience, similar to Windows or macOS.

### File Format Choices

The choice of file formats in CoreFeetConcepts was driven by specific design considerations:

* **`.md` (Markdown):**
    * Markdown was chosen for `master_index.md`, `user_index.md`, `categorized_index.md`, and `command_log.md` due to its simplicity, readability, and widespread support.
    * For index files (`master_index.md`, `user_index.md`, `categorized_index.md`), Markdown's plain text format allows for easy parsing and manipulation, making it suitable for storing lists of file paths and key-value pairs.
    * For the `command_log.md` markdown was chosen for its human readability, and it is easy to view in any text editor.
* **`.yml` (YAML):**
    * YAML was selected for metadata files due to its human-readable syntax and ability to represent complex data structures.
    * While `.yaml` is the standard extension, `.yml` is also supported for compatibility with existing files or personal preferences. The scripts are designed to handle both extensions.
* **`.log` vs. `.md` for Command Logs:**
    * Although `.log` is the conventional extension for log files, `.md` was chosen for `command_log.md` to leverage Markdown's readability and formatting capabilities. This allows for better organization and presentation of log entries, especially when viewed in a Markdown editor.
    * This also allows for easier integration of log data into documentation or other Markdown-based systems.

These file format choices reflect a balance between human readability, ease of parsing, and compatibility with existing tools and conventions.

##   Development Note

Both TutorialIDs and FolderKeys were generated with AI assistance. Lists of file and folder paths were provided as input, and the AI assistant returned the keys in colon-separated text format. This approach was also chosen to parse lists of strings into quoted, comma-separated values, ready for use in an array.

* This empowers users to organize and manage their files more effectively by leveraging the metadata embedded within them.
* The YAML module allows the software to read and interpret user-submitted YAML files, which can contain instructions for file processing.

###   OS_Environment Folder Explanation

The `OS_Environment` folder within this project contains documentation related to the operating system environment and any virtualizations currently being used during the development of CoreFeetConcepts. This folder captures the software configurations, dependencies, and environment setups. **Crucially, users only need to install the software and libraries listed in the "Prerequisites" section of this document. The contents of this folder are for informational purposes, to document the environment used for development, and are not intended as additional installation instructions.**

**Important Note:** The `Equipment_Notes` folder referenced below is located in the root directory of your overall project structure, **not within this GitHub repository**. This repository represents a portion of your larger project. For the full context of your documentation structure, please refer to the `Home_Directory_README.md` file.

**Rationale:**

* **Project-Specific Environment:** Unlike the comprehensive documentation found in `Equipment_Notes\SilverFox_Laptop`, which focuses on the entire operating system and its pre-installed software, the `OS_Environment` folder here is tailored to the tracking of software, installation steps, and configurations for software development. It's a snapshot of what issues should be tracked and how a development environment is configured.
* **Reduced Detail (For User Setup):** For user setup, the "Prerequisites" section provides the *necessary* software. The `OS_Environment` folder has more detail about a software development environment, which may include tools or versions not strictly required for basic usage. The focus for users is on the essential setup steps in "Prerequisites."
* **Consistency (In Documentation):** While the level of detail varies, the concept of documenting the environment remains consistent across projects, devices, and online courses. This ensures that future developers can understand the development context.

####   **Relationship to `Equipment_Notes` and `Online_Courses`:**

* **`Equipment_Notes\SilverFox_Laptop`:** This folder, located in your project's root directory, contains extensive documentation about the "SilverFox" laptop's operating system, software installations, PATH variables, and virtual machines. It serves as a comprehensive guide for maintaining and updating the development environment on the computer itself.
* **`Online_Courses`:** Documentation for online courses will typically follow a similar pattern to project documentation, with less focus on low-level operating system details relevant to the user's machine. Many courses provide their own virtual environments, IDEs, or cloud-based development platforms, reducing the need for detailed local environment setups.
* **`My_Projects`:** Each project within `My_Projects` will have its own `OS_Environment` folder, focusing on the specific configurations used for that project's development.
* **Structure:** When the `OS_Environment` documentation requires more detail, such as in `Equipment_Notes\SilverFox_Laptop`, the structure includes at least four key subfolders: `Installation_Logs`, `OS_Environments`, `PATH_Variable_Snapshots`, and `Software_Installers`. For project or course-specific OS_Environments, the detail is reduced, keeping it specific to the project or course development setup.

**In summary:**

The `OS_Environment` folder in this project provides a concise overview of a development environment. Users should refer to the "Prerequisites" section for installation instructions. The level of detail here is intentionally greater than what a user needs to get started, and less than that found in the `Equipment_Notes\SilverFox_Laptop` folder, which documents an entire operating system's configuration. This approach ensures that project-specific environment documentation is focused and relevant to software development and what a user should consider of documenting in their own projects.

## Folders

*   **Ideas:** A space for brainstorming and documenting future project enhancements.
*   **Implemented_Scripts:** Contains PowerShell and Python scripts used to automate tasks.
*   **Implemented_Structures:** Holds pre-built directory structures and templates:
    *   **Activity:** A folder where users create and save YAML files related to their activities.
    *   **Events:** A folder where YAML files are copied when retrieved through search filters, allowing for centralized review.
    *   **Website:** Contains files for the CoreFeetConcepts website.
*   **Metadata_Templates:** YAML templates for creating metadata files.
*   **Notes:** General notes and documentation for the project.
*   **OS_Environmnet:** Folder allows for clear separation of host and virtual machine configurations. Documents software installed, updates, .iso images, and list of installers for the environment.
    *   [`SilverFox_Laptop_Setup.md`](OS_Environment/SilverFox_Laptop_Setup.md): The environment of a computer for software development.
*   **Programming_Languages:** Contains language-specific resources and examples.

## Files

* **categorized_index.md:** An index of categorized relative paths within the file tree.
* **current_dir.md:** Stores the base path of the CS_Knowledge_Base directory.
* **folder_key_index.md:** This file contains a mapping of relative paths to unique key identifiers for each folder within the CS_Knowledge_Base structure, including CoreFeetConcepts as a subfolder. The format is a colon-separated value, with the relative path as the key and the unique identifier as the value.
* **master_index.md:** A master index of the entire file tree.
* **programming_languages_list.md:** A list of programming languages that a computer scientist might encounter. This list is used by scripts to generate directory structures (see `Implemented_Scripts\README.md` for details).
* **user_index.md:** A user-specific index of the entire file tree. This file is a copy of `master_index.md`, modified according to the user's preferences.
* **TutorialIDAssignment.md:** This file serves as a lookup table for the scripts and readme files used within the CoreFeetConcepts project. It assigns a unique identifier to each script and readme file. The format is a colon-separated value, with the original file name as the key and the unique identifier as the value.
    * **Example:** `Definitions_README.md (Home Directory) - CoreFeetConcepts-README-003`
    * **Header:**

        ```markdown
        # Tutorial ID Assignment
        ```
* **Home_Directory_README.md:** This is the main `README.md` file for the root directory of the entire CS_Knowledge_Base project. It provides an overview of the entire knowledge base's structure and purpose. It is included here for context, even though it resides in the root directory.
* **Definitions_README.md:** Located in the `Definitions` directory, this README file outlines the purpose and structure of the `Definitions` folder, which is a repository for computer science terminology.
* **acm_classification.md:** Located in the `Definitions` directory, this file contains the original list of topics extracted from the ACM 2023 curriculum and serves as the foundation for the organization of the `Definitions` folder.
* **acm_details.md:** Located in the `Definitions` directory, this file provides a detailed breakdown of the topics from the ACM curriculum and their associated subjects, expanding on the original list to clarify the relationships between different areas of study.
* **acm_suggested_folder_directory.md:** Located in the `Definitions` directory, this file presents the final suggested directory structure for the `Definitions` folder, based on the ACM curriculum, consolidating related subjects into cohesive topics for a more organized and user-friendly system.
* **previously_used_keywords.md:** Stores keywords used in prior YAML documents for further categorization.
* **previously_used_categories.md:** Stores categories used in prior YAML documents to maintain categorization consistency, even if old folders are deleted and new categories are added. This file serves as a reference to ensure that even when the file structure changes, a record of previously used categories is retained for potential reuse or to avoid creating redundant categories.


## Key Folders for Automation

*   **Implemented_Scripts:** This is where all the scripts used in this project are stored.
*   **Activity:** This is where the user will be creating and saving YAML files.
*   **Events:** A folder where YAML files are automatically copied when they match specific search filters, allowing for centralized review and analysis.

## Features

-   **Automated directory structure creation:** Quickly establish a consistent and organized file system.
-   **YAML metadata management:** Easily add and manage metadata for your files using YAML.
-   **Indexing and categorization:** Automatically create and maintain indexes for efficient data retrieval.
-   **Data validation:** Ensure data integrity through robust validation checks.
-   **Script documentation generation:** Automatically generate documentation for your scripts.
-   **HTML and PDF conversion:** Convert YAML metadata into easily accessible HTML and PDF documents.

## Target Audience

CoreFeetConcepts is designed for a broad range of users, including:

-   **Students:** To organize study materials and research.
-   **Writers:** To manage notes, drafts, and research.
-   **Photographers:** To catalog and organize image libraries.
-   **Teachers:** To create and manage course materials.

## Future Enhancements

This section outlines planned improvements and potential additions to CoreFeetConcepts. Contributions and suggestions are welcome!

### I. Codebase Improvements

* **Refactoring and Optimization:**
    * Improve code readability, maintainability, and performance through refactoring.
    * Optimize algorithms and data structures for efficiency.
    * Reduce the use of `if` statements where possible to improve code efficiency.
* **Performance Testing and Optimization:**
    * Implement performance tests to evaluate the efficiency of the software as the data scales (e.g., with hundreds of files).
    * Optimize code for speed and resource usage based on test results.
* **Modularity and Reusability:**
    * Design the codebase to be more modular, allowing for easier extension and integration with other systems.
* **Enhanced Error Handling and Logging:**
    * Implement robust error handling to prevent unexpected crashes and provide informative error messages.
    * Use a logging system to track events, debug issues, and monitor performance.
* **Automated Testing:**
    * Implement unit tests and integration tests to ensure code quality and prevent regressions.

### II. Core Functionality

* **Advanced Search and Filtering:**
    * Implement more complex search queries using Boolean operators, regular expressions, and faceted search.
    * Allow users to save and reuse common search filters.
* **Data Import/Export:**
    * Enable importing metadata from other formats (e.g., CSV, JSON).
    * Allow exporting metadata to various formats for interoperability.
* **Automated Data Validation:**
    * Implement rules and schemas to validate YAML metadata against predefined standards.
    * Provide feedback to users on data inconsistencies.
* **Relationship Mapping:**
    * Develop a system for defining and visualizing relationships between data entries.
    * This could involve graph databases or other relationship management techniques.

### III. User Interface and Experience

* **Web-Based Access:**
    * Explore the possibility of providing access to CoreFeetConcepts through a web interface.
* **Interactive CLI:**
    * Enhance the command-line interface with interactive elements, autocompletion, and helpful prompts.
* **Improved Documentation Generation:**
    * Automate the generation of comprehensive documentation from code comments and metadata.
    * Support different output formats (e.g., HTML, PDF).
* **Accessibility Improvements:**
    * Ensure that CoreFeetConcepts is accessible to users with disabilities by following accessibility guidelines.

### IV. Integration and Expansion

* **Version Control Integration:**
    * Integrate CoreFeetConcepts with version control systems (e.g., Git) to track changes and collaborate effectively.
* **Plugin System:**
    * Design a plugin system that allows users to extend CoreFeetConcepts with custom functionality.
* **Community Features:**
    * Consider adding features to facilitate community contributions, such as forums or a knowledge base.

### V. Ultimate Goal

* **Graphical User Interface (GUI):**
    * Develop a user-friendly GUI to interact with CoreFeetConcepts.
    * This would make the software more accessible to users who are not comfortable with the command line.

## Contributing

We welcome contributions from students and learners of all backgrounds!

**Definitions Folder Contributions:**

We are particularly interested in input from students studying majors *other than Computer Science*. Your unique perspective can help us create a richer and more comprehensive `Definitions` folder. We believe that students currently immersed in their respective fields are best suited to define the subfolders and topics within the `Definitions` directory.

Here's how you can contribute:

*   **Suggest new subfolders:** Propose subfolders within `Definitions` that align with your major or course of study.
*   **Define topic organization:** Help us structure the content within these subfolders to accurately reflect the key concepts and terminology of your field.
*   **Provide examples:** Share specific examples of definitions or topics that would be beneficial to include.

**How to contribute:**

*   Please submit your suggestions or ideas by submitting your suggestions or ideas by opening an issue on our GitHub repository.
*   Clearly state your major or course of study and explain how your contributions would improve the `Definitions` folder.

**Coding Contributions:**

The scripts within this project are designed to be user-configurable. We will release new versions and updates as time allows. If you have suggestions for improvements or encounter any issues, please feel free to [Specify how you would like to receive coding suggestions, e.g., open an issue on GitHub].

## Author
This project was created by Hector Baez. For any questions or feedback, you can reach me at unicopehh1@gmail.com
**Note:** UnicopeHH is a brand name.

## Acknowledgements

This project benefited significantly from AI assistance:

* **Google Gemini:** Gemini was instrumental in code collaboration and literature refinement. It excelled at:
    * String parsing and pattern matching.
    * File input/output operations.
    * Generating machine-generated identifiers.
    * Providing complete and accurate `if`, `elseif`, `try`, and `except` syntax for both PowerShell and Python.
    * Offering design suggestions and solutions.
    * Providing high-quality literature explanations for diverse readers.
* **Copilot:** Copilot was primarily used for generating code comments, streamlining the documentation process.

This project also drew upon the guidance and resources provided by:

* **Association for Computing Machinery (ACM) Curriculum Guidelines:** The 2023 ACM Computer Science Curricula Recommendations, available at [https://dl.acm.org/doi/book/10.1145/3664191](https://dl.acm.org/doi/book/10.1145/3664191), served as a valuable reference for defining topics and categories within the academic major Computer Science.

## License

For license information, please see [LICENSE](LICENSE.txt)

**Note:** The name "CoreFeetConcepts" may be subject to change in the future, if this software is adopted by a larger research or study project.8
