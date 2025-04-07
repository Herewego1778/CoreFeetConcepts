---
FolderKey: "PROJECTS-COREFEET-TEMPLATES" # Unique key
---

# CoreFeetConcept - Metadata_Templates

### File Path: My_Projects\CoreFeetConcept\Metadata_Templates\README.md
### Folder: My_Projects\CoreFeetConcept\Metadata_Templates
### TutorialID: CoreFeetConcept-README-005

## Usage:

The Metadata_Templates folder contains templates for documenting definitions, sources, and README files. It's recommended to track your README files using a PowerShell script.

Create metadata templates for each course or project, containing prefilled key-value pairs. Avoid storing too many templates in one folder. Save predefined templates in their corresponding project folders, or, if you have only a few projects, store them here until project completion.

`metadata_template_core_data.yml` provides common descriptions for documenting definitions, courses, or video notes. `script_documentation_template.yml` contains placeholders for Python scripts to dynamically create YAML files from other source files. `subscription_example.yml` demonstrates how to use YAML anchors to generate dynamic content for blog posts or other purposes.

**Extending with Custom Templates:**
Users are encouraged to create their own custom YAML templates to suit specific needs. The provided templates serve as examples of how YAML can be leveraged for metadata management. Consider creating templates for:
* **Hardware Specifications:** To document hardware components, configurations, and technical details.
* **Ventures/Projects:** To track project goals, timelines, team members, and progress.
* **Software Installation Logs:** To record software installations, dependencies, configuration steps, and troubleshooting information. These logs could be formatted in YAML for structured data or Markdown for human-readable documentation that can be converted to other formats (e.g., HTML, PDF).

By creating custom templates, users can extend the system's capabilities to manage a wide range of information in a structured and efficient manner.

## Files and Folders listed in current directory

* **`metadata_template_core_data.yml`:** This file provides a core data structure for YAML metadata, defining keys for categorizing and linking files. It establishes a foundation for documenting various content types, including definitions, course materials, and video notes. Notably, the `Content` key enables the creation of a nested table of contents, where each entry's `Title` serves as a table of contents heading.

* **`script_documentation_template.yml`:**  A template for Python scripts to dynamically create documented metadata from source YAML files with anchors and aliases. It contains placeholders for Python to insert content.

* **`subscription_example.yml`:**  An example source of data for subscription services using YAML anchors to dynamically generate random content for metadata structures.

* **`script_dynamic_documentation_template.yml`:** Another example of a structure that can be dynamically filled by a Python script, with keys like sources, links, images, and content. Python will add information after the Content key. This template is used with the `dynamic_script_documentation.py` script.

* **`html_jinja2_template.md`:** This example is used in the `generate_html_from_yaml.py` script. The html_template variable is passed to the script, allowing configuration of a new HTML template.

* **`css_yaml_documentation.yml`:** An example YAML structure that can maintain different CSS themes, and a Python script can be made to retrieve a specific theme.

### Definition Metadata Template (`metadata_template_definition_data.yml`)

This YAML template (`metadata_template_definition_data.yml`) is designed for documenting definitions of terms, concepts, or entities. It provides a structured way to capture the essential components of a definition, including the term itself, its explanation, and any associated media or related content.

**Key Features:**
* **Core Definition Elements:** Captures the `FileName`, `Title` (or `Term`), and the `Definition` text.
* **Categorization:** Includes fields for `Discipline`, `Category`, and `Keywords` to facilitate organization and retrieval.
* **Formula Documentation:** Provides structured fields (`Formula`, `Representation`, `Explanation`) for documenting any associated formulas.
* **Image Linking:** Supports linking to relevant images using the `Images` key, including `ImageID`, `FilePath`, and `AltText` for each image.
* **Cross-Referencing:** The `RelatedContent` key allows linking to other definitions, articles, or resources.
* **Contextual Information:** Includes fields for `DateCreated`, `LastModified`, and `TutorialID` to provide context and aid in referencing.

This template enables the creation of a well-organized repository of definitions, ensuring clarity, consistency, and easy access to important information.

### Media Metadata Template (`metadata_template_media_data.yml`)

This YAML template (`metadata_template_media_data.yml`) is designed to facilitate the organization and retrieval of media files (images, PDFs, videos) within a project, course, or tutorial. It allows users to map various media assets and associate them with relevant metadata, enhancing searchability and long-term management.

**Key Features:**
* **Comprehensive Metadata:** Stores essential information about the media collection (e.g., `FileName`, `FilePath`, `Title`, `ProjectName`, `CourseName`, `TutorialID`).
* **Media Type Grouping with Flexible Sectioning:** Organizes metadata by media type (`images`, `pdf`, `videos`) and allows for optional sectioning within the file. Users can group media types under keys like `Section1`, `Chapter 1`, or any other descriptive name. YAML allows spaces in keys, providing flexibility for user-defined sections.
* **Table of Contents Potential:** These user-defined section keys can be used to generate a table of contents for the media map. Alternatively, users can add a `Title` key within each section or media type to provide a title for that specific group of media.
* **Detailed File Information:** For each media file, the template records details such as `FilePath`, `Title`, `Description`, `Category`, `Keywords`, `UsedInExperience`, `RelatedContent`, and format-specific properties (e.g., `Dimensions` for images/videos, page count for PDFs).
* **Contextual Linking:** Supports associating media files with specific projects, courses, or tutorials through keys like `ProjectName`, `CourseName`, and `TutorialID`.

## Additional Recommendations
Store and document different HTML and CSS templates. Templates customed to a current course or further documentation of a current project.

