# Software Development Environment Setup - SilverFox Laptop (Windows 11 Home Edition 64-Bit)

**Date of Setup:** March 28, 2025
**Notes:** There is a PowerShell and Command Prompt to retrieving relative folder paths.
    ```PowerShell
    (Get-Command python).Path
    ```
    * Press Windows+R and enter `cmd`
    ```Command-prompt
    where python
    ```
### Laptop Hotkeys
* **Boot Menu:** F10
* **Boot Device Options:** F9
* **HP System Information:** F2
* **[Function Key]:** F1 (Please fill in the function associated with F1)

## I. PATH Environment Variable Modifications

**PATH Explanation:**
* **Default Behavior:** When Python is installed from the official Python website, the installer usually provides an option to add Python to the system's PATH environment variable.
* **App Execution Aliases (Microsoft Store):** If Python is installed from the Microsoft Store, Windows sets up "app execution aliases" instead of directly modifying the PATH. These aliases allow you to run Python from the command line without explicit PATH entries.
* **Why Manual PATH Addition?** Although the app execution aliases work, many online courses and older applications expect Python to be accessible through the traditional PATH variable. Therefore, to ensure compatibility and follow common practices, it's often recommended to manually add Python's installation directory to the PATH.
* **Priority of PATH Variables:** Windows searches the User PATH first, and then the System PATH.If a command is found in both locations, the one in the User PATH will take precedence. This can lead to unexpected behavior if you intend to use a specific version of a tool.
* **Review Both PATH Variables:** Carefully examine the entries in both the User and System PATH variables. Decide whether each directory in the PATH should be accessible to only the user or entire system. Remove any duplicate entries and consolidate entries specifically if it is for a user, this variable should be in the user environment.

**Notes:** Configuring the PATH System Environment Variable
* **Access System Properties:**
    * Press `Windows + R` to open the Run dialog.
    * Enter `sysdm.cpl` and press Enter.
* **Open Environment Variables:**
    * In the System Properties window, navigate to the "Advanced" tab.
    * Click the "Environment Variables..." button.
* **Locate and Edit the PATH Variable:**
    * In the "System variables" section, find the variable named "Path".
    * Select "Path" and click "Edit...".
* **Add or Edit Paths:**
    * **Add a new path:** Click "New" and enter the full directory path.
    * **Edit an existing path:** Select the path and click "Edit".
    * **Reorder paths:** Use the up/down arrows to change the order.
* **Save Changes:**
    * Click "OK" on all open windows to save your changes.
**Important Notes:**
* **Restart Requirement:** You may need to restart your computer or command prompt for changes to take effect.
* **User vs. System Variables:**
    * "User variables" affect only the current user.
    * "System variables" affect all users.
* **Path Separator:** Paths are separated by semicolons (`;`).
* **Verify Changes:** Open a new command prompt and type `echo %PATH%` to confirm the changes.

**Notes:** Retrieve the list of User and System PATH environment variables as list of strings, on a new line, trimmed, and piped into a file.
    ```PowerShell
    "User PATH:"
    ([Environment]::GetEnvironmentVariable("Path", "User") -split ';') | ForEach-Object { $_.Trim() } | Out-File PATH_Variables.txt -Encoding UTF8
    ""
    "System PATH:"
    ([Environment]::GetEnvironmentVariable("Path", "Machine") -split ';') | ForEach-Object { $_.Trim() } | Out-File PATH_Variables.txt -Append -Encoding UTF8
    ```
    * **Notes:** reg query "registry_key" /v Path queries the registry for the specified PATH variable. redirect the output to .txt files.
    ```Command-prompt
    reg query "HKCU\Environment" /v Path > User_PATH.txt
    reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path > System_PATH.txt
    ```

**Notes:**

This section will track any additions or removals made to the system or user PATH environment variables.

| Date       | Type   | Location (User/System) | Change Description                               | Modification Notes                                        |
| :--------- | :----- | :--------------------- | :----------------------------------------------- | :-------------------------------------------------------- |
| 2025-03-28 | Add    | User                   | Added Python Scripts directory to PATH             | To ensure compatibility with online courses and tools.    |
| 2025-03-28 | Add    | User                   | Added Python installation directory to PATH        | To ensure compatibility with online courses and tools.    |
| 2025-03-28 | Add    | User                   | Added .NET tools directory to PATH               | Added by .NET SDK installation.                                |
| 2025-03-28 | Add    | User                   | Added VS Code binaries directory to PATH          | To run VS Code from the command line.                      |
| 2025-03-28 | System | System                 | Added WindowsApps directory to PATH              | For Microsoft Store applications and aliases.                |
| 2025-03-28 | System | System                 | Added Windows system32 directory to PATH           | Core Windows system files.                                |
| 2025-03-28 | System | System                 | Added Windows directory to PATH                  | Core Windows system files.                                |
| 2025-03-28 | System | System                 | Added Wbem directory to PATH                     | Windows Management Instrumentation files.                  |
| 2025-03-28 | System | System                 | Added Windows PowerShell directory to PATH         | Windows PowerShell executable.                               |
| 2025-03-28 | System | System                 | Added OpenSSH directory to PATH                  | OpenSSH client and server.                                   |
| 2025-03-28 | System | System                 | Added HP One Agent directory to PATH               | HP support software.                                       |
| 2025-03-28 | System | System                 | Added Microsoft SQL Server tools directory to PATH | SQL Server command-line tools.                               |
| 2025-03-28 | System | System                 | Added Microsoft SQL Server ODBC directory to PATH  | SQL Server ODBC configuration tools.                            |
| 2025-03-28 | System | System                 | Added .NET SDK directory to PATH                 | .NET SDK command-line tools.                               |
| 2025-03-28 | System | System                 | Added Windows Performance Toolkit directory to PATH | Windows Performance Toolkit tools.                               |
| 2025-03-29 | System | System                 | Added Android cmdline-tools bin to PATH          | Android SDK command-line tools.                                |
| 2025-03-29 | System | System                 | Added Android platform-tools to PATH             | Android SDK platform tools.                                   |
| 2025-03-29 | System | System                 | Added Java jdk-24 bin to PATH                   | Java 24 command-line tools.                                |
| 2025-03-29 | System | System                 | Added JAVA_HOME system variable.                 | Root location of Java 24 installation.                    |
| 2025-03-29 | System | System                 | Added PHP 8.4.5 (NTS) directory to PATH          | PHP command-line tools (NTS).       |
| 2025-03-29 | System | System                 | Added PHP 8.4.5 (TS) directory to PATH           | PHP command-line tools (TS).        |

**Current PATH Environment Snapshot 2025-03-29**

User PATH:
C:\Users\unico\AppData\Local\Programs\Python\Python313\Scripts\
C:\Users\unico\AppData\Local\Programs\Python\Python313\
C:\Users\unico\.dotnet\tools
C:\Users\unico\AppData\Local\Programs\Microsoft VS Code\bin

System PATH:
C:\Users\unico\AppData\Local\Microsoft\WindowsApps
C:\WINDOWS\system32
C:\WINDOWS
C:\WINDOWS\System32\Wbem
C:\WINDOWS\System32\WindowsPowerShell\v1.0\
C:\WINDOWS\System32\OpenSSH\
C:\Program Files\HP\HP One Agent
C:\Program Files\Microsoft SQL Server\150\Tools\Binn\
C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\
C:\Program Files\dotnet\
C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit\
C:\php\php-8.4.5
C:\php\php-8.4.5-ts
C:\Android\sdk\cmdline-tools\bin
C:\Android\sdk\platform-tools
C:\Program Files\Java\jdk-24\bin
JAVA_HOME

**Addressing Duplicates:**

You've correctly observed that there are duplicate entries between the User and System PATH variables.
* **Priority:**
    * Windows searches the User PATH first, and then the System PATH.
* **Implications:**
    * If a command is found in both locations, the one in the User PATH will take precedence.
    * This can lead to unexpected behavior if you intend to use a specific version of a tool.
* **Best Practice:**
    * It's generally best to avoid duplicate entries.
    * If a directory should be available to all users, add it to the System PATH.
    * If it's specific to your user account, add it to the User PATH.

**Recommendation:**
* Review the entries in both the User and System PATH variables.
* Decide which entries should be available to all users and which should be user-specific.
* Remove the duplicate entries.
* For example, python, and dotnet tools, and VS code are specific to your user, and should be removed from the system path.
* Java and Android SDK tools should be in the system path.

## II. Development Tools and Environments

This section lists the development tools and environments available on the system, categorized by type.

##### A. Shells and Command-Line Interfaces
*   **PowerShell:** You must review **Administrator rights** before installing modules, executing scripts, and using the right-click option to Run PowerShell.
*   **PowerShell ISE (Integrated Scripting Environment)**
*   **.NET CLI (Command-Line Interface):** Included with **.NET SDK 9.0**.
*   **Command Prompt:** Available on Windows.
*   **MSYS2 Shell:** Installed as part of the **GTK** setup.
*   **Git:** Software application that provides a visual way to interact with Git.

##### B. Programming Languages
*   **Python:** (Version **3.13.2**)
*   **R:** (Version **R-4.4.3**)
*   **PowerShell:** To modify the **execution policy**, you must run PowerShell as an administrator.
*   **.NET (C#, F#, etc.):** Supported by **.NET SDK 9.0** and **.NET Framework 4.8.1**.
*   **Java:** (Version **JDK 24**)
*   **PHP:** (Versions **8.4.5 NTS** and **8.4.5 TS**)
*   **JavaScript:** Inherently supported by web browsers like **Google Chrome**.
*   **[Future Languages]:**

##### C. Integrated Development Environments (IDEs) and Editors
*   **Visual Studio Code (VS Code):** (Version **1.98.2**)
*   **Visual Studio 2022 Community:** (Version **17.13.5**)
*   **RStudio:** (Version **2024.12.1+563**)
*   **Python IDLE (Integrated Development and Learning Environment):** Installed with **Python**.
*   **Android Studio Meerkat:** (Version **2024.3.1 Patch 1**)
*   **[Future IDEs/Editors]:**

##### D. Database Management Systems (DBMS)

##### E. Installed Software and Utilities
This section lists software and utilities installed on the system, beyond the base operating system, organized by category.
    * **Communication**
        * **Zoom:** A video conferencing and online meeting platform.
    * **System Utilities**
        * **Windows Media Creation Tool:** Utility provided by Microsoft that allows users to create installation media (like a bootable USB drive or ISO file) for Windows 10 or Windows 11, enabling clean installs or upgrades on other computers.

## III. Language-Specific Packages

### A. PowerShell Modules
* **powershell-yaml**
    * **Description:** Provides cmdlets for serializing and deserializing YAML data, enabling PowerShell to interact with YAML files and data structures.
    * **Notes:**
        * An alternative, older module is `PSYaml`, which requires PowerShell 2.0 or later.
        * `powershell-yaml` requires PowerShell 3.0 or later.
    * **Installation and Import:**
        * To install the `powershell-yaml` module from the PowerShell Gallery, run:
            ```powershell
            Install-Module -Name powershell-yaml
            ```
        * To import the module into your current session, run:
            ```powershell
            Import-Module -Name powershell-yaml
            ```
* **ImportExcel**
    * **Description:** The primary and widely-used PowerShell module for interacting with Excel. It allows reading, writing, and manipulating Excel spreadsheets without requiring Microsoft Excel to be installed.
    * **Notes:**
        * Another module, `ExcelPSLib`, exists but is less commonly used.
    * **Installation and Import:**
        * To install the `ImportExcel` module from the PowerShell Gallery, run:
            ```powershell
            Install-Module -Name ImportExcel
            ```
        * To import the module into your current session, run:
            ```powershell
            Import-Module -Name ImportExcel
            ```

### B. Python Packages
* **re**
    * **Description:** Regular expression operations. Part of the Python standard library.
    * **Notes:** No separate installation needed.
* **shutil**
    * **Description:** High-level file operations. Part of the Python standard library.
    * **Notes:** No separate installation needed.
* **os**
    * **Description:** Miscellaneous operating system interfaces. Part of the Python standard library.
    * **Notes:** No separate installation needed.
* **pyyaml**
    * **Description:** YAML parser and emitter for Python.
    * **Installation:**
        ```bash
        pip install pyyaml
        ```
* **Jinja2**
    * **Description:** Jinja2 is a templating engine for Python, used to generate dynamic content in various formats like HTML, XML, or LaTeX.
    * **Installation:**
        ```bash
        pip install jinja2
        ```
* **xhtml2pdf**
    * **Description:** HTML to PDF converter using Python, the ReportLab Toolkit, html5lib and pypdf. It supports HTML5 and CSS 2.1 (and some of CSS 3). It is completely written in pure Python, so it is platform independent.
    * **Automatic Installation:** pip checks the xhtml2pdf package's metadata (specifically, it's setup.py file) for a list of dependencies. It then downloads and installs those dependencies before installing xhtml2pdf itself.
    * **Installation:**
        ```bash
        pip install xhtml2pdf
        ```
* **ReportLab Toolkit**
    * **Description:** Library for creating PDF documents and graphics.
    * **Notes:** Installed as a dependency of xhtml2pdf.
* **html5lib**
    * **Description:** HTML parser/tokenizer written in pure Python.
    * **Notes:** Installed as a dependency of xhtml2pdf.
* **pypdf**
    * **Description:** A pure-python PDF library capable of splitting, merging, cropping, and transforming the pages of PDF files.
    * **Notes:** Installed as a dependency of xhtml2pdf.
* **pytest**
    * **Description:** A mature full-featured Python testing tool.
    * **Installation:**
        ```bash
        pip install pytest
        ```
* **Pillow (PIL Fork)**
    * **Description:** Python Imaging Library (fork) adds image processing capabilities to your Python interpreter.
    * **Installation:**
        ```bash
        pip install pillow
        ```
* **Markdown**
    * **Description:** This is a popular and actively maintained library that closely follows the original Markdown specification while offering extensions for additional functionality like tables, code highlighting, and more. It's a robust choice for general-purpose Markdown processing.
    * **Installation:**
        ``bash
        pip install markdown
        ``` 
* **fpdf2**
    * **Description:** Compared with other PDF libraries, fpdf2 is fast, versatile, easy to learn and to extend (example). It is also entirely written in Python and has very few dependencies: Pillow, defusedxml, & fontTools. It is a fork and the successor of PyFPDF (cf. history).
    * **Installation:**
        ``bash
        pip install fpdf2
        ``` 
* **validator-collection**
    * **Description:** A Python library of validators for common data structures. Provides a set of functions and classes for validating data inputs, such as strings, numbers, dates, and more.
    * **Installation:**
        ```bash
        pip install validator-collection
        ```
    * **Notes:** Useful for data validation, especially when working with data that will be visualized using matplotlib.
* **pathlib**
    * **Description:** Object-oriented filesystem paths. Part of the Python standard library.
    * **Notes:** No separate installation needed.
* **tkinter**
    * **Description:** Python interface to the Tk GUI toolkit. Part of the Python standard library.
    * **Notes:** No separate installation needed.
* **GTK Libraries (via MSYS2)**
    * **Description:** Libraries for creating graphical user interfaces with Python using GTK.
    * **Notes:**
        * GTK libraries were installed using MSYS2. Refer to the MSYS2 installation section for details.
        * To use GTK with Python, you will likely need the `pygobject` package (install with `pip install pygobject`).
* **WeasyPrint**
    * **Description:** WeasyPrint is a smart solution helping web developers to create PDF documents from HTML and CSS. It turns simple HTML pages into gorgeous statistical reports, invoices, tickets…
    * **Installation:**
        ```bash
        pip install weasyprint
        ```
    * **Notes:** WeasyPrint has a few dependencies. Follow the link for proper installation. You need the GTK MSYS2 shell, the GTK3 or GTK4 modules, and the Pango module. Review the installation of MSYS2 and ensure that the MSYS2 `C:\msys64` folder is added to your System PATH environment variable. [https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#windows](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#windows)
* **[Other Packages]**
    * **Description:** [Description of the package]
    * **Installation:**
        ```bash
        pip install [package_name]
        ```

### R Packages
* The downloaded source packages are in `C:\Users\unico\AppData\Local\Temp\RtmpqumLC2\downloaded_packages`
* ```install.packages(c("matlib", "magrittr", "tidyverse", "ggplot2", "rnaturalearth", "rnaturalearthdata", "ggthemes", "sf"))```
* **matlib**
    * **Description:** Functions for matrix algebra.
    * **Installation:**
        ```R
        install.packages("matlib")
        ```
* **magrittr**
    * **Description:** Provides a set of tools for functional programming, especially the pipe operator `%>%`.
    * **Installation:**
        ```R
        install.packages("magrittr")
        ```
* **tidyverse**
    * **Description:** A collection of R packages designed for data science, including ggplot2, dplyr, tidyr, and more.
    * **Installation:**
        ```R
        install.packages("tidyverse")
        ```
* **ggplot2**
    * **Description:** A system for declaratively creating graphics, based on "The Grammar of Graphics".
    * **Installation:**
        ```R
        install.packages("ggplot2")
        ```
* **rnaturalearth**
    * **Description:** Provides access to natural earth map data.
    * **Installation:**
        ```R
        install.packages("rnaturalearth")
        ```
* **rnaturalearthdata**
    * **Description:** Data package for rnaturalearth.
    * **Installation:**
        ```R
        install.packages("rnaturalearthdata")
        ```
* **ggthemes**
    * **Description:** Extra themes, scales, and geoms for ggplot2.
    * **Installation:**
        ```R
        install.packages("ggthemes")
        ```
* **sf**
    * **Description:** Simple Features for R: Support for spatial vector data.
    * **Installation:**
        ```R
        install.packages("sf")
        ```
**Important Notes:**
* **R Code Blocks:** Use ` ```R ``` to indicate R code blocks in Markdown.
* **Installation Method:** Clearly state that these packages are installed using `install.packages()`.
* **Tidyverse Note:** Note that tidyverse installs many other packages.
* **RStudio Context:** While the commands work in any R environment, it's implied that you'll likely run these within RStudio.
* **Dependencies:** R will automatically install any dependencies for these packages.

## IV. Python Virtual Environments and Packages

This section will track virtual environments created for specific Python projects and the packages installed within them.

### Project: [Name of Your First Python Project]

* **Virtual Environment Location:** `[Path to your project's .venv folder]`
* **Date Created:** [Date]
* **Activated using:** `.\.venv\Scripts\activate` (PowerShell) or `.\.venv\Scripts\activate` (Command Prompt)
* **Installed Packages:**
    * `tkinter` (Part of standard library)
    * `pygobject`
        * Version: [Version installed using pip]
        * Installation Date: [Date]
    * [Other packages installed with `pip install`]

### Project: [Name of Your Second Python Project]

* **Virtual Environment Location:** `[Path to your project's .venv folder]`
* **Date Created:** [Date]
* **Activated using:** `.\.venv\Scripts\activate` (PowerShell) or `.\.venv\Scripts\activate` (Command Prompt)
* **Installed Packages:**
    * [List packages and their versions]

## V. Virtual Machines

This section will track the virtual machines created for isolated environments using VirtualBox.

### A. VirtualBox VMs

* **Notes:** Will be used for virtual machines once VirtualBox is successfully installed.

## VI. Base Software Installations

This section tracks the core software installed on the SilverFox Laptop for software development.

##### Python
*   **Software:**  Python
*   **Download Link:**  [Download Python](https://www.python.org/downloads/)
*   **License Link:**  [Python Software Foundation License](https://docs.python.org/3/license.html)
*   **Downloaded File:**  `python-3.13.2-amd64.exe` (27.2 MB)
*   **Downloaded File Path:**  `C:\Users\unico\Downloads`
*   **Description:**  To use the language Python and available libraries.
*   **Version:**  3.13.2 (64-bit)
*   **Disk Space:**  159 MB
*   **Dependencies and Prerequisites:** [None]
*   **Download Date:**  March 28, 2025
*   **Installation Date:**  March 28, 2025
*   **Folder Path:**  `C:\Users\unico\AppData\Local\Programs\python.exe`
*   **Installation Issues:**  [None]
*   **Installed Components:**
    *   IDLE
    *   pip
    *   Documentation
    *   Shortcuts
    *   File associations
*   **Installation Steps:**
    *   Run the `python-3.13.2-amd64.exe` installer.
    *   Follow the settings prompted by the installer.
    *   **Crucially, ensure the option to "Add Python to PATH" is selected during installation**.
    *   Include IDLE, pip, and documentation.
    *   Create shortcuts and file associations.
    *   Use administrator privileges when installing `py.exe`.
    *   Add `python.exe` to PATH (This is usually done by the installer if the option is selected).
    **Decline to allow Python to pass the file path limit of 250 characters.**
*   **Configure:**  [Not Applicable]
*   **Notes:**  [None]

##### GTK
*   **Software:**  GTK and Python 
*   **Download Link:**  https://www.gtk.org/docs/installations/windows/ 
*   **License Link:**  https://www.gtk.org/ 
*   **Downloaded File:**  `msys2-x86_64-20250221.exe` (81.9 MB) 
*   **Downloaded File Path:**  `C:\Users\unico\Downloads`
*   **Description:**  To use with Python to create GUI applications. GTK is a free and open-source cross-platform widget toolkit for creating graphical user interfaces. In Python, GTK is commonly used through the PyGObject library, which provides access to the GObject-based GTK library. GTK offers a wide range of pre-built widgets like buttons, windows, and toolbars, making it suitable for developing applications ranging from small tools to comprehensive application suites.
*   **Version:**  4.18.2 For Windows 
*   **Disk Space:**  Download Size: 93.66 MiB, Total Installed Size: 668.57 MiB
*   **Download Date:**  March 28, 2025
*   **Installation Date:**  March 28, 2025 
*   **Folder Path:**  `C:\msys64`
*   **Installation Issues:**  [None]
*   **Installed Components:**
    *   MSYS2 environment (required for GTK installation)
    *   GTK4 libraries and dependencies **(if installed using the GTK4 command)**
    *   GTK3 libraries and dependencies **(if installed using the GTK3 command)**
    *   GTK Toolchain
    *   GTK in Python
    *   GCC to start compiling projects
    *   Pango for weasyprint library
*   **Installation Steps:** Create a directory `C:\msys64` (MSYS2 installer will use this directory). 
    *   **Step 1: Download and Install MSYS2:**
        *   Download the MSYS2 installer appropriate for your platform.
        *   Follow the installation instructions provided by the installer.
    *   **Step 2: Install GTK4 (or GTK3) and Dependencies:**
        *   Open an MSYS2 shell.
        *   **For GTK4 Development:** Run the following command.
            ```bash 
            pacman -S mingw-w64-ucrt-x86_64-gtk4
            ```   
        *   **For GTK3 Development (Alternative):** Run the following command.
            ```bash 
            pacman -S mingw-w64-ucrt-x86_64-gtk3
            ```   
        *   **If you want to develop a GTK application in C, C++, Fortran, etc, you’ll need a compiler like GCC and its toolchain:** Run the following command.
            ```bash 
            pacman -S mingw-w64-ucrt-x86_64-toolchain base-devel
            ```   
        *   **GTK application in Python, you need to install the Python bindings** Run the following command.
            ```bash 
            pacman -S mingw-w64-ucrt-x86_64-python-gobject
            ```   
        *   **GCC to start compiling projects:** Run the following command.
            ```bash 
            pacman -S mingw-w64-ucrt-x86_64-gcc
            ```   
        *   **Pango for weasyprint library:** Run the following command.
            ```bash 
            pacman -S mingw-w64-x86_64-pango
            ```   
        *   **Note:** For additional installation steps and instructions on compiling GTK applications, refer to the information provided at the download link.
*   **Configure:**  [Not Applicable]
*   **Notes:**
    *   Added Start Menu shortcut - MSYS2.
    *   This tool does have a Shell.
    *   The tool you want to use is the UCRT64 shell (yellow logo).
    *   You must add MSYS2 to the System PATH environment variable.

##### Visual Studio Code (VS Code)
*   **Software:**  Visual Studio Code
*   **Download Link:**  https://code.visualstudio.com/download
*   **License Link:**  https://code.visualstudio.com/license (Microsoft Software License Terms for Visual Studio Code)
*   **Downloaded File:**  `VSCodeUserSetup-x64-1.97.202503271047.exe` (102 MB)
*   **Downloaded File Path:**  `C:\Users\unico\Downloads`
*   **Description:**  A editor for programming and viewing files.
*   **Dependencies and Prerequisites:** [None]
*   **Version:**  1.98.2 For Windows 
*   **Disk Space:**  402 MB
*   **Download Date:**  March 28, 2025
*   **Installation Date:**  March 28, 2025
*   **Folder Path:**  [Not specified]
*   **Installation Issues:**  [None mentioned]
*   **Installed Components:**
    *   Python (by Microsoft) - Once you install this extension you inherently install the Pylance and Python Debugger extensions as well.
    *   Pylance 
    *   Python Debugger 
    *   PowerShell 
    *   Dictionary Completion - For checking misspelling.
    *   Markdown All in One - For viewing markdown files.
    *   Gemini Code Assist 
*   **Installation Steps:**
    *   Follow the on-screen instructions.
*   **Configure:**  [Not Applicable]
*   **Notes:**  VSCode added itself to the PATH during installation.

##### Visual Studio 2022 Community
*   **Software:** Visual Studio 2022 Community
*   **Download Link:** https://visualstudio.microsoft.com/vs/community/
*   **License Link:** https://visualstudio.microsoft.com/license-terms/mlt0324vs2022community/ (Visual Studio Community 2022 License Terms)
*   **Downloaded File:** `VisualStudioSetup.exe` (4.24 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** A Web browser made by Google.
*   **Version:** 17.13.5 For Windows
*   **Dependencies and Prerequisites:** [None explicitly mentioned]
*   **Download Date:** March 28, 2025
*   **Installation Date:** March 28, 2025
*   **Folder Path:** [Not specified]
*   **Installation Issues:** [None mentioned]
*   **Installed Components:**
    *   ASP.NET and web development (Consider if needed initially)
    *   Azure Development
    *   Node.js Development
    *   Python Development
    *   .NET Multi-platform App UI Development
    *   .NET Desktop Development
    *   .NET SDK 9.0.201
    *   Office/Share Point Development
    *   Data Storage and Processing
    *   Data Science and Analytical Application
    *   Linux and Embedded Development
    *   WinUI Application Development
    *   Desktop Development with C++
    *   Mobile Develoopment with C++
*   **Installation Steps:**
    *   Run the `VisualStudioSetup.exe` installer.
    *   Follow the on-screen instructions to select and install the desired components.
*   **Configure:** [Not Applicable at this stage]
*   **Notes:** Includes NuGet Package Manager.

##### .NET SDK 9.0
*   **Software:** .NET Software Development Kit (SDK)
*   **Download Link:** https://dotnet.microsoft.com/download
*   **License Link:** https://dotnet.microsoft.com/en-us/dotnet-eula (Microsoft .NET Software License Terms)
*   **Downloaded File:** (File not present)
*   **Downloaded File Path:** [Not applicable] (installed via Visual Studio Installer)
*   **Description:** A software development kit (SDK) from Microsoft that provides the tools and libraries needed to build and run .NET applications, including improvements for AI integration, performance boosts, and new tools for building distributed applications. 
*   **Version:** 9.0.3
*   **Dependencies and Prerequisites:** [Not Specified]
*   **Download Date:** March 28, 2025
*   **Installation Date:** March 28, 2025
*   **Folder Path:** [Not Specified]
*   **Installation Issues:** [Not Mentioned]
*   **Installed Components:**
    *   .NET SDK 9.0.3
    *   .NET Runtime 9.0.3
    *   ASP.NET Core Runtime 9.0.3
    *   .NET Desktop Runtime 9.0.3
*   **Installation Steps:** The .NET SDK 9.0 was installed as an optional component during the installation of Visual Studio 2022 Community. Ensure that the .NET desktop development workload (or similar workload containing .NET SDK components) is selected during the Visual Studio installation process.
*   **Configure:** [Not Applicable]
*   **Notes:** Includes the .NET Command Line Interface (CLI). The .NET SDK was installed by selecting the appropriate workloads during the Visual Studio 2022 Community installation. A separate download and installation of the SDK .exe file were not required in this setup.

##### .NET Framework 4.8.1 Developer Pack
*   **Software:** .NET Framework 4.8.1 Developer Pack
*   **Download Link:** https://dotnet.microsoft.com/en-us/download/dotnet-framework/thank-you/net481-developer-pack-offline-installer
*   **License Link:** https://www.microsoft.com/en-us/legal/terms-of-use (Terms of Use)
*   **Downloaded File:** `NDP481-DevPack-ENU.exe` (98.7 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** .NET Framework is a Windows-only version of .NET for building client and server applications. This is the older, Windows-only .NET platform. Installing the .NET Framework is primarily for compatibility with older enterprise systems that might rely on it.
*   **Version:** 4.8.1 For Windows
*   **Dependencies and Prerequisites:** [Not Specified]
*   **Download Date:** March 28, 2025
*   **Installation Date:** March 28, 2025
*   **Folder Path:** [Not Specified]
*   **Installation Issues:** [Not Mentioned]
*   **Installed Components:** [Not Specified]
*   **Installation Steps:** Follow the on-screen instructions.
*   **Configure:** [Not Applicable]
*   **Notes:** The Developer Pack includes the runtime and the tools, libraries, and headers needed to develop applications that target the .NET Framework. The Runtime Pack is only necessary to run applications/programs built with the .NET Framework.
  
##### Visual C++ Redistributable for Visual Studio 2015-2022 x64
*   **Software:** Microsoft Visual C++ Redistributable X64 Version 14.42.34438.0
*   **Download Link:** [Link to the Microsfot Visuall C++ download page](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)
*   **License Link:** [Microsoft Terms of Use](https://learn.microsoft.com/en-us/legal/termsofuse)
*   **Downloaded File:** `VC_redist.x64.exe` (24.4 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** The Visual C++ Redistributable installs Microsoft C and C++ (MSVC) runtime libraries. Many applications built using Microsoft C and C++ tools require these libraries. If your app uses those libraries, a Microsoft Visual C++ Redistributable package must be installed on the target system before you install your app.
*   **Version:** 4.42.34438.0 (64-bit)
*   **Dependencies and Prerequisites:** [None Specified]
*   **Download Date:** [2025-03-28]
*   **Installation Date:** [2025-03-28]
*   **Folder Path:** [Not Specified]
*   **Installation Issues:** The X64 Redistributable package contains both ARM64 and X64 binaries. This package makes it easy to install required Visual C++ ARM64 binaries when the X64 Redistributable is installed on an ARM64 device.
*   **Installed Components:** [Not Specified]
*   **Installation Steps:** Follow the on-screen instructions.
*   **Configure:** [Not Applicable]
*   **Notes:** [None]

##### VirtualBox by Oracle
*   **Software:** VirtualBox
*   **Download Link:** https://www.oracle.com/virtualization/technologies/vm/downloads/virtualbox-downloads.html?source=:ow:o:p:nav:mmddyyVirtualBoxHero&intcmp=:ow:o:p:nav:mmddyyVirtualBoxHero
*   **License Link:** https://www.oracle.com/corporate/?source=:ow:o:p:nav:mmddyyVirtualBoxHero (GNU General Public License, version 2)
*   **Downloaded File:** `VirtualBox-7.0.18-164778-Win.exe` (117 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** To create virtual machines and isolate software and projects.
*   **Version:** 7.1.6 Windows (64-bit)
*   **Dependencies and Prerequisites:** Missing Visual C++ Redistributable
*   **Download Date:** March 28, 2025
*   **Installation Date:** March 28. 2025
*   **Folder Path:** `C:\Program Files\Oracle`
*   **Installation Issues:** Installation ended prematurely due to missing Visual C++ Redistributable.
*   **Installed Components:** Base Packages
*   **Installation Steps:** Follow the on-screen instructions.
*   **Configure:** [Not Applicable]
*   **Notes:** Oracle's free and open-source virtualization software. Will be used for virtual machines.

##### Google Chrome Browser
*   **Software:** Google Chrome Browser
*   **Download Link:** https://www.google.com/chrome/dr/download/?brand=CHBD&ds_kid=43700078335693470&gad_source=1&gclid=Cj0KCQjwkZm_BhDrARIsAAEbX1E4pBwHJoXQ66ksb_llFkFe6aWc96DWiwTFSdpSZnsquZ6KAP9XwiwaAgs5EALw_wcB&gclsrc=aw.ds
*   **License Link:** [Not Specified]
*   **Downloaded File:** `ChromeSetup.exe` (10.2 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** A Web browser made by Google.
*   **Version:** For Windows 11/10 (64-bit)
*   **Dependencies and Prerequisites:** [Not Specified]
*   **Download Date:** March 28, 2025
*   **Installation Date:** March 28. 2025
*   **Folder Path:** 
*   **Installation Issues:** * [Not Specified More Specifically]
*   **Installed Components:** [Not Specified]
*   **Installation Steps:** [Not Specified]
*   **Configure:** [Not Applicable]
*   **Notes:** * [Not Specified More Specifically]

##### R (CRAN)
*   **Software:** Comprehensive R Archive Network
*   **Download Link:** https://posit.co/download/rstudio-desktop/
*   **License Link:** https://www.r-project.org/foundation/ ("R is an official part of the Free Software Foundation’s GNU project, and the R Foundation has similar goals to other open source software foundations like the Apache Foundation or the GNOME Foundation." - as quoted)
*   **Downloaded File:** `R-4.4.3-win.exe` (84.2 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** R is a language and environment for statistical computing and graphics. It is a GNU project which is similar to the S language and environment which was developed at Bell Laboratories (formerly AT&T, now Lucent Technologies).
*   **Version:** R-4.4.3 for Windows, (64-bit)
*   **Dependencies and Prerequisites:** [None]
*   **Download Date:** March 28, 2025
*   **Installation Date:** March 28. 2025
*   **Folder Path:** `Programs\R`
*   **Installation Issues:** Do you want to customize the startup options? - No (accept defaults)
*   **Installed Components:**
    *   Main Files
    *   64-bit Files
    *   Message translation
    *   Start Menu shortcut
    *   Desktop shortcut
    *   Version number in register saved
    *   Association with .RData files created
*   **Installation Steps:** Accept defaults for startup options.
*   **Configure:** [Not Applicable]
*   **Notes:** [None]

##### RStudio Desktop
*   **Software:** RStudio integrated development environment (IDE)
*   **Download Link:** https://posit.co/download/rstudio-desktop/
*   **License Link:** https://posit.co/about/ ("R is an official part of the Free Software Foundation’s GNU project, and the R Foundation has similar goals to other open source software foundations like the Apache Foundation or the GNOME Foundation." - as quoted)
*   **Downloaded File:** `RStudio-2024.12.1-563.exe` (265.28 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** Working with the R language I also installed RStudio as it is a set of tools built to help you be more productive with R and Python.
*   **Version:** 2024.12.1+563 for Windows 10/11, (64-bit)
*   **Dependencies and Prerequisites:** [None]
*   **Download Date:** March 28, 2025
*   **Installation Date:** March 28. 2025
*   **Folder Path:** `C:\Program Files\RStudio`
*   **Installation Issues:** 
*   **Installed Components:** [Not Specified]
*   **Installation Steps:** Follow the on-screen instructions.
*   **Configure:** [Not Applicable]
*   **Notes:** [None]

##### Java JDK (Java Development Kit)
*   **Software:** Java SE Development Kit 24 (JDK)
*   **Download Link:** [Java Downloads](https://www.oracle.com/java/technologies/downloads/)
*   **License Link:** [Link to the appropriate license for the JDK distribution](https://www.oracle.com/legal/copyright/)
*   **Downloaded File:** `jdk-24_windows-x64_bin.exe` (205.76 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** The Java Development Kit is essential for developing Java applications. It includes the Java Runtime Environment (JRE), compilers (like javac), debuggers, and other tools necessary to create, build, and run Java software. Installing the JDK allows you to write and compile Java code on your system. The JDK includes the JVM (Java Virtual Machine) which is required to run Java applications.
*   **Version:** 24 (64-bit)
*   **Dependencies and Prerequisites:** [None Specified]
*   **Download Date:** [2025-03-28]
*   **Installation Date:** [2025-03-28]
*   **Folder Path:** `C:\Program Files\Java\jdk-24\`
*   **Installation Issues:** [None Specified]
*   **Installed Components:** [Not Specified]
*   **Installation Steps:** Leave the folder to default and follow the on-screen instructions.
*   **Configure:** [Not Applicable]
*   **Notes:** The JDK includes the JVM (Java Virtual Machine) which is required to run Java applications.

##### PHP 8.4 (8.4.5) NTS
*   **Software:** PHP: Hypertext Preprocessor 8.4 (8.4.5) Non-Thread Safe
*   **Download Link:** [Link to the PHP.net download page](https://windows.php.net/download/)
*   **License Link:** [Link to the appropriate license for PHP](https://windows.php.net/license/)
*   **Downloaded File:**
    *   `php-8.4.5-nts-Win32-vs17-x64.zip` (32.21 MB)
    *   `php-debug-pack-8.4.5-nts-Win32-vs17-x64.zip` (37.02 MB)
    *   `php-devel-pack-8.4.5-nts-Win32-vs17-x64.zip` (1.35 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads\PHP_Installer`
*   **Description:** A popular, open-source, server-side scripting language primarily used for web development to create dynamic web pages.
*   Version: 8.4.5 NTS VS17 x64 (64-bit)
*   **Dependencies and Prerequisites:** Requires the Visual C runtime (CRT), you must install the Visual C++ Redistributable for Visual Studio 2015-2022 x64 or x86. II(FastCGI) requires the NTS version.
*   **Download Date:** [2025-03-28]
*   **Installation Date:** [2025-03-28]
*   **Folder Path:** `C:\php\php-8.4.5`
*   **Installation Issues:** PHP requires the Visual C++ Redistributable for Visual Studio 2015-2022 x64 or x86. If it is already installed, the installer will tell you. You must save all files into one subfolder to keep the files organized.
*   **Installed Components:**
    *   Zip (Non Thread Safe): Contains the core PHP binaries and libraries.
    *   Debug Pack (Non Thread Safe): Essential for debugging PHP code.
    *   Development Package (SDK) (Non Thread Safe): Required to develop PHP extensions.
*   **Installation Steps:**
    *   Download each file.
    *   Create a directory `C:\php\php-8.4.5`.
    *   Extract the contents of `php-8.4.5-nts-Win32-vs17-x64.zip` directly into the `C:\php\php-8.4.5 folder`.
    *   Extract the contents of `php-debug-pack-8.4.5-nts-Win32-vs17-x64.zip` and `php-devel-pack-8.4.5-nts-Win32-vs17-x64.zip` into the `C:\php\php-8.4.5 folder`, ensuring that the extension folder and other related files from these archives are merged with the files already in `C:\php\php-8.4.5`.
    *   Inside the `C:\php\php-8.4.5 folder`, locate `php.ini-development` file.
    *   Copy `php.ini-development` and rename the copy to `php.ini`.
    *   Open `php.ini` in a text editor.
        *   Extension Directory: Verify that On Windows's `extension_dir = "ext"` (At line 760) is correctly pointing to the ext folder within your PHP installation (e.g., extension_dir = "C:\php\php-8.4.5\ext"). Also delete the ; at the beginning of the line.
        *   Enable Extensions: Uncomment the extensions you need, such as pdo_mysql (line 932), mysqli (line 898), gd (line 921), and curl (line 917).
        *   Timezone: Set your timezone in the date.timezone setting.
        *   Error Reporting: Adjust error reporting as needed for your development environment.
    *   Add PHP to the System PATH (Optional, but Recommended):
        * Open the Windows Start Menu and search for "environment variables."
        * Select "Edit the system environment variables."
        * Click "Environment Variables..."   
        * In the "System variables" section, find the "Path" variable and click "Edit..."
        * Click "New" and add the path to your PHP directory (e.g., C:\php\php-8.4.5).   
        * Click "OK" on all open windows.
    *   Test PHP from the Command Line: 
        * Open PowerShell or Command Prompt.
        * Type ```php -v``` and press Enter to verify the PHP version.
        * Type ```php -m``` and press Enter to list loaded modules.
        * Create a `test.php` file with ```<?php phpinfo(); ?>``` and run `php test.php` to verify the
*   **Configure:** Configure `php.ini` as needed (extension directory, extensions, timezone, error reporting). Web Server Integration for IIS (FastCGI) will need to be configured separately.
*   **Notes:** By downloading both NTS and TS versions now, you'll have them readily available when you configure each web server. II(FastCGI) requires the NTS version. Pay close attention to the extensions you enable in `php.ini`. Only enable the ones you need. These steps are for command-line PHP. You'll need to configure your web server (IIS) separately.

##### PHP 8.4 (8.4.5) TS
*   **Software:** PHP: Hypertext Preprocessor 8.4 (8.4.5) Thread Safe
*   **Download Link:** [Link to the PHP.net download page](https://windows.php.net/download/)
*   **License Link:** [Link to the appropriate license for PHP](https://windows.php.net/license/)
*   **Downloaded File:**
    *   `php-8.4.5-Win32-vs17-x64.zip` (32.36 MB)
    *   `php-debug-pack-8.4.5-Win32-vs17-x64.zip` (36.92 MB)
    *   `php-devel-pack-8.4.5-Win32-vs17-x64.zip` (1.35 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads\PHP_Installer`
*   **Description:** A popular, open-source, server-side scripting language primarily used for web development to create dynamic web pages.
*   **Version:** 8.4.5 TS VS17 x64 (64-bit)
*   **Dependencies and Prerequisites:** Requires the Visual C runtime (CRT), you must install the Visual C++ Redistributable for Visual Studio 2015-2022 x64 or x86. Apache (apache2handler) requires the TS version.
*   **Download Date:** [2025-03-28]
*   **Installation Date:** [2025-03-28]
*   **Folder Path:** `C:\php\php-8.4.5-ts`
*   **Installation Issues:** PHP requires the Visual C++ Redistributable for Visual Studio 2015-2022 x64 or x86. If it is already installed, the installer will tell you. You must save all files into one subfolder to keep the files organized.
*   **Installed Components:**
    *   Zip (Thread Safe): Contains the core PHP binaries and libraries.
    *   Debug Pack (Thread Safe): Essential for debugging PHP code.
    *   Development Package (SDK) (Thread Safe): Required to develop PHP extensions.
*   **Installation Steps:**
    *   Create Directory: Create the `C:\php\php-8.4.5-ts` folder.
    *   Extract the contents of `php-8.4.5-Win32-vs17-x64.zip` (Thread Safe) directly into the `C:\php\php-8.4.5-ts folder`.
    *   Extract the contents of `php-debug-pack-8.4.5-Win32-vs17-x64.zip` and `php-devel-pack-8.4.5-Win32-vs17-x64.zip` into the `C:\php\php-8.4.5-ts` folder, merging the extension folder and other related files.
    *   Configure `php.ini`: Copy `php.ini-development` from the `C:\php\php-8.4.5-ts` folder and rename the copy to `php.ini`.
    *   Open `php.ini` in a text editor and configure it as needed (extension directory, extensions, timezone, error reporting).
    *   Add to System PATH (Optional): If you want to use the Thread Safe version from the command line, add `C:\php\php-8.4.5-ts` to your system PATH.
        * Open the Windows Start Menu and search for "environment variables."
        * Select "Edit the system environment variables."
        * Click "Environment Variables..."   
        * In the "System variables" section, find the "Path" variable and click "Edit..."
        * Click "New" and add the path to your PHP directory (e.g., C:\php\php-8.4.5-ts).   
        * Click "OK" on all open windows.
    *   Test the Thread Safe Version: Follow these additional steps.
        * Open PowerShell or Command Prompt.
        * Type ```php -v``` and press Enter to verify the PHP version. Or ```C:\php\php-8.4.5-ts\php.exe -v```
        * Type ```php -m``` and press Enter to list loaded modules. Or ```C:\php\php-8.4.5-ts\php.exe -m```
        * Create a `test.php` file with ```<?php phpinfo(); ?>``` and run php test.php to verify the
*   **Configure:** Configure `php.ini` as needed (extension directory, extensions, timezone, error reporting). Web Server Integration for Apache (apache2handler) will need to be configured separately.
*   **Notes:** By downloading both NTS and TS versions now, you'll have them readily available when you configure each web server. Apache (apache2handler) requires the TS version. Pay close attention to the extensions you enable in `php.ini`. Only enable the ones you need. These steps are for command-line PHP. You'll need to configure your web server (Apache) separately.

##### Apache Web Server
*   **Software:** Apache HTTP Server 2.4.63 (httpd): 2.4.63
*   **Download Link:** [Link to the Apache Web Server download page](https://httpd.apache.org/docs/current/platform/windows.html#down)
*   **License Link:** [Apache License](https://www.apache.org/licenses/)
*   **Downloaded File:** `httpd-2.4.63-250207-win64-VS17.zip` (11.4 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Description:** Popular, open-source, cross-platform web server software that delivers web content like HTML pages, images, and CSS files over the internet.
*   **Version:** Apache 2.4 binaries VS17 (For Windows, 64-bit)
*   **Disk Space:**
*   **Download Date:** [2025-03-28]
*   **Installation Date:** [2025-03-28]
*   **Folder Path:** `C:\Apache24`
*   **Installation Issues:** Apache httpd for Microsoft Windows is available from a number of third party vendors as stated from their website. I chose Apache Lounge. **Important:** Choose the correct version of Apache that matches your PHP Thread Safe (TS) version. Since you are using PHP VS17 x64, you will want the VS17 x64 version of Apache: Apache 2.4.63-250207 Win64.
*   **Installation Steps:**
    *   Download the zip file (e.g., `httpd-2.4.63-250207-win64-VS17.zip`).
    *   Create a directory where you want to install Apache (e.g., `C:\Apache24`).
    *   Extract the contents of the downloaded zip file into the `C:\Apache24` directory.
    *   **Configure Apache:**
        *   Navigate to `C:\Apache24\conf`.
        *   Open the `httpd.conf` file in a text editor (like Notepad or VS Code).
        *   **Essential Configuration**
            *   **ServerRoot:** Ensure that the `ServerRoot` directive (line 37) points to your Apache installation directory. **The directive might be set as a variable**.
            *   **Listen:** (At line 60) Set the port that Apache will listen on. The default is port 80, If port 80 is already in use, you can change it to another port (e.g., `Listen 8080`).
            *   **ServerAdmin:** Set `ServerAdmin` directive (line 218) and add your email address.
            *   **ServerName:** Set the `ServerName` directive (line 227) and delete the `#` symbol at the beginning of the line. For local development, you can use `localhost`. If you changed the `Listen` port, adjust the port in `ServerName` accordingly.
            *   **DocumentRoot:** Set the `DocumentRoot` directive (line 251) to the directory where your website files will be located.
        *   **PHP Integration:** Add the lines after the LoadModule and continue down as files are read in this fashion.
                 ```Apache
                LoadModule php_module "C:/php/php-8.4.5-ts/php8apache2_4.dll" # At line 186
                AddHandler application/x-httpd-php .php # At line 424
                PHPIniDir "C:/php/php-8.4.5-ts"  # line 425
                ```
            Add the preceding lines to configure Apache to work with PHP (using `php_module`). **Make sure to adjust the paths to match your PHP installation directory**.
        *   **Install Apache as a Service:**
            *   Open a Command Prompt or PowerShell window as administrator. Navigate to the `C:\Apache24\bin` directory. Run the following command to install Apache as a service. If you encounter errors, check the `httpd.conf` file for any syntax errors. Windows will prompt you to allow Apache access:
            ```bash
            httpd -k install -n "Apache24" -f "C:\Apache24\conf\httpd.conf"
            ```
        *   **Start Apache:** You can start Apache from the Services app (search for "services" in the Start Menu) or from the command line:
            ```bash
            net start Apache24
            ```
        *   **Test Apache:**
            *   Open your web browser and go to `http://localhost`.
            *   If Apache is working correctly, you should see the "It works!" page.
        *   **Create a PHP Test File:**
            *   Create a file named `test.php` in your `DocumentRoot` directory (as configured in `httpd.conf`).
            *   Add the following code to `test.php`:
            ```php
            <?php
            phpinfo();
            ?>
            ```
            *   Open your web browser and go to `http://localhost/test.php`.
*   **Notes:** PHP x64 VS17 is backward compatible, That means, a VS16/15/14 module can be used inside the VS17 binary.
    *   **Firewall:** If you encounter issues accessing `http://localhost`, ensure that your firewall is not blocking Apache.
    *   **Ports:** If you change the default port (80), make sure to specify the correct port in your browser (e.g., `http://localhost:8080`).
    *   **Security:** For production environments, configure Apache with appropriate security settings.
    *   **Virtual Hosts:** If you plan to host multiple websites, explore Apache's virtual host configuration.
    *   **PHP Modules:** If you need additional PHP functionality, enable the required extensions in your `php.ini` file and restart Apache.

### Web Technologies: JavaScript, CSS, HTML, and XML

These technologies are fundamental to web development and are inherently supported by web browsers (like Google Chrome). You do not need to install separate runtime environments on your operating system to execute code written in these languages within a web browser.

* **JavaScript:** As the scripting language of the web, JavaScript enables dynamic and interactive elements on web pages. Google Chrome provides a powerful set of developer tools, accessible through Chrome DevTools (usually opened by pressing F12), which includes a console where you can write and execute JavaScript code directly within the browser environment. This allows you to test and experiment with JavaScript without needing a separate terminal-based JavaScript interpreter installed on your system. The execution context is the web browser itself.
* **CSS (Cascading Style Sheets):** CSS is used to control the presentation and styling of web pages. While CSS is not directly executable in the same way as JavaScript, you can inspect and modify CSS styles in real-time using Chrome DevTools. This allows you to experiment with different styles and see the effects immediately.
* **HTML (HyperText Markup Language):** HTML is the standard markup language for creating web pages. Browsers interpret HTML code to render the content and structure of web pages. You can view and modify the HTML structure of a web page using Chrome DevTools' Elements panel, allowing you to examine and experiment with HTML elements.
* **XML (Extensible Markup Language):** While not as directly tied to web page interaction as JavaScript, CSS, or HTML, XML is used for data representation and exchange. Browsers can interpret XML data, and you can inspect XML data structures using Chrome DevTools' Network panel (if the XML data is loaded via a network request).

##### Android Studio

*   **Software:** Android Studio
*   **Description:** The official Integrated Development Environment (IDE) for Android app development, provided by Google. It offers a comprehensive suite of tools for designing, coding, debugging, and testing Android applications. It's built on IntelliJ IDEA.
*   **Download Link:** [Link to the official Android Studio download page, e.g., Android Developers](https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwiJyoGpobOMAxW7qFoFHRU0JDEYABAAGgJ2dQ&co=1&ase=2&gclid=Cj0KCQjw16O_BhDNARIsAC3i2GAx_nZ6dyZdieZoWWNJ7SbSd9-6borEjOc0U6NVX4exdz0mYzT-g58aAhW5EALw_wcB&ohost=www.google.com&cid=CAESVeD2LiYf3vLlKOIlt2-HgBd2pBs3GXA8PLqbp2tdUxaDlypZApuSe5WTjgo1V-xfy0yqgboyrqxYblg-SvI0itSpa-pm3KlZKDmAmaBZvBLJklgcaG0&sig=AOD64_3DR8HSFAoq1mIbYQRwF03LsvY0NA&q&nis=4&adurl&ved=2ahUKEwifwemoobOMAxWESDABHfDRPKEQ0Qx6BAgJEAE)
*   **License Link:** [Link to the Android Studio license agreement](https://developer.android.com/license?_gl=1*1eoxu8s*_up*MQ..&gclid=Cj0KCQjw16O_BhDNARIsAC3i2GAx_nZ6dyZdieZoWWNJ7SbSd9-6borEjOc0U6NVX4exdz0mYzT-g58aAhW5EALw_wcB&gclsrc=aw.ds&
*   **Downloaded File:** `android-studio-2024.3.1.14-windows.exe` (1.22 GB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Version:** Android Studio Meerkat 2024.3.1 Patch 1 for Windows
*   **Disk Space:** 2.24 GB
*   **Download Date:** `[2025-03-28]`
*   **Installation Date:** `[2025-03-28]`
*   **Folder Path:** `C:\Users\unico\AppData\Local\Android\Sdk`
*   **Installation Issues:** [None mentioned]
*   **Installation Steps:**
    *   Leave the folder to default and follow the on-screen instructions.
    *   Standard Version (Recommended for users)
*   **Installed Components:**
    *   Android Virtual Device
    *   Android Studio
    *   Setup Type: Standard
    *   Android Emulator - 402 MB
    *   Android Emulator hypervisor driver (installer) - 172 KB
    *   Android SDK Build-Tools 35.0.1 - 57.1 MB
    *   Android SDK Build-Tools 36 - 56 MB
    *   Android SDK Platform 35 - 61.3 MB
    *   Android SDK Platform-Tools - 6.39 MB
    *   Google Play Intel x86_64 Atom System Image - 1.62 GB
    *   Sources for Android 35 - 46.4 MB
*   **Notes:** Essential for native Android development using Java or Kotlin. It includes emulators for testing your apps. Added to the Start Menu and created a shortcut.

##### **Android SDK (Software Development Kit)**
*   **Description:** A set of tools, libraries, documentation, code samples, and processes required to build and test applications for the Android operating system. The SDK is usually managed through Android Studio.
*   **Download Link:** [Link to the SDK Platform from Google](https://developer.android.com/tools/releases/platform-tools)
*   **License Link:** [Link to the Android SDK license agreement](https://developer.android.com/license?_gl=1*9ubjz5*_up*MQ..&gclid=Cj0KCQjw16O_BhDNARIsAC3i2GA9KaTbYf3mwW_UNX4bjf7gJ3WKUltSpw0MuS3ESIgIfj3OLE_od_MaAm0-EALw_wcB&gclsrc=aw.ds&
*   **Downloaded File:**
    *   `platform-tools-latest-windows.zip` (6.80 MB)
    *   `commandlinetools-win-13114758_latest.zip` (136 MB)
*   **Downloaded File Path:** `C:\Users\unico\Downloads`
*   **Version:**
*   **Disk Space:**
*   **Download Date:** `[2025-03-28]`
*   **Installation Date:** `[2025-03-28]`
*   **Folder Path:** `C:\Android\sdk` 
*   **Installation Issues:** This comes as two zip files. You need the **command-line tools** that are part of the Android SDK. These include tools for managing SDK packages, emulators, and build processes. And you need the **Platform tools**, package primarily contains `adb` and `fastboot`, which are essential for device communication and low-level operations.
*   **Installation Steps:**
    *   Create a directory `C:\Android\sdk`
    *   Extract `commandlinetools-win-13114758_latest.zip` into the `C:\Android\sdk`
    *   **Important:** The zip file will likely extract into a subdirectory (e.g., `C:\Android\sdk\cmdline-tools`). **Make sure to note the exact location of the extracted tools.**
    *   Extract `platform-tools-latest-windows.zip` into the `C:\Android\sdk`. This will create a `C:\Android\sdk\platform-tools` subdirectory.
    *   **Add to System PATH (Strongly Recommended):**
        *   Open the Windows Start Menu and search for "environment variables."
        *   Select "Edit the system environment variables."
        *   Click "Environment Variables..."
        *   In the "System variables" section, find the "**Path**" variable and click "**Edit...**"
        *   Click "**New**" and add the following paths:
            *   `C:\Android\sdk\cmdline-tools\latest\bin` (or the correct path to the `bin` directory within your extracted `cmdline-tools` folder)
            *   `C:\Android\sdk\platform-tools`
        *   Click "**OK**" on all open windows.
        *   **Note:** If you extracted the command line tools to a location other than `C:\Android\sdk`, **adjust the paths accordingly.**
    *   **Verify Installation:**
        *   Open a **new** Command Prompt or PowerShell window. (If you had one open before adding to PATH, close and reopen it for the changes to take effect.)
        *   **Verify adb:** Type `adb --version` and press Enter. If adb is installed correctly, you'll see the version information.
        *   **Verify sdkmanager:** Type `sdkmanager --version` and press enter. If the sdkmanager is installed correctly, you will see the version information.
        *   **Important Notes:**
            *   **Administrator Privileges:** You might need administrator privileges to modify the system PATH.
            *   **Correct Paths:** **Double-check the paths** to the `tools` and `platform-tools` directories.
            *   **Updates:** The Android SDK tools are updated regularly. You can use the `sdkmanager` tool to update them.
            *   **Documentation:** Android's official documentation is a valuable resource for using the SDK tools.
*   **Install Java 17 or Higher:**
    *   **Android SDK command-line tools: the sdkmanager requires Java version 17 or higher**, and your system is either using an older version or not finding a suitable Java installation.
*   **Set JAVA_HOME Environment Variable (If Necessary):**
    *   Open the Windows Start Menu and search for "environment variables."
    *   Select "Edit the system environment variables."
    *   Click "Environment Variables..."
    *   In the "System variables" section, click "**New...**"
    *   For "**Variable name**," enter `JAVA_HOME`.
    *   For "**Variable value**," enter the path to your Java installation directory (e.g., `C:\Program Files\Java\jdk-24`).
    *   Click "**OK**" on all open windows.
    *   **Verify:** Open a **new** Command Prompt or PowerShell window and type `echo %JAVA_HOME%`. It should display the Java installation path.
    *   **Notes:** If the issue continues then **check your Systems PATH Environment** as Oracle Java installation creates a default PATH variable and this might be pointing to an old version of Java. Even if you've correctly set `JAVA_HOME`, `sdkmanager` might still be finding the older Java version in the `javapath` directory, which **takes precedence over `JAVA_HOME`**. Solution is to **delete the PATH variable Oracle created and rely on the new `JAVA_HOME` variable.**

## VI. Future Considerations

* **Perl:** May install Strawberry Perl later for text processing tasks.
* **Apple Development Software:** Xcode for developing applications for Apple devices.**
* **Belena Etcher:** Free, open-source utility designed for flashing operating system images to SD cards and USB drives, making it easy to create bootable media for various devices and operating systems.
* **Git:** Software application that provides a visual way to interact with Git, a version control system, simplifying tasks like staging files, creating commits, and managing branches, compared to using the command-line interface. 
* **MySQL Shell:** Simple SQL shell that allows users to interact with a MySQL database server using text-based commands.
* **MySQL Workbench:** Unified, cross-platform, open-source visual tool that simplifies MySQL and SQL development, offering data modeling, SQL development, and administration tools for server configuration, user management, and more. 
* **MySQL Community Server:** An open-source relational database management system (RDBMS) that uses Structured Query Language (SQL) to manage and store data, and is known for its reliability, performance, and scalability, making it a popular choice for various applications. 
* **MediaInfo**
    * **Description:** A free, open-source program that displays technical and tag data for video and audio files. It shows information like codec, duration, bitrate, resolution, subtitles, and more.
    * **Download Link:** [Link to the official MediaInfo download page, e.g., MediaInfo SourceForge](https://sourceforge.net/projects/mediainfo/) or [MediaArea.net](https://mediaarea.net/en/MediaInfo/Download)
    * **License Link:** [Link to the MediaInfo license, typically GNU GPL]
    * **Downloaded File:** `MediaInfo_GUI_[version]_Windows.exe` (Filename will vary based on version)
    * **Downloaded File Path:** `C:\Users\unico\Downloads` (Example)
    * **Installation Date:** [YYYY-MM-DD]
    * **Folder Path:** `C:\Program Files (x86)\MediaInfo` (Default, might vary)
    * **Installation Steps:** Follow the instructions in the installer. Consider installing the command-line version as well.
    * **Notes:** Useful for analyzing multimedia files. Consider the command-line version (`MediaInfo.exe`) for scripting.

* **ExifTool**
    * **Description:** A free, open-source command-line application for reading, writing, and editing meta information in a wide variety of files, including images, audio, video, and PDF. It supports many different metadata formats (Exif, IPTC, XMP, etc.).
    * **Download Link:** [Link to the official ExifTool download page, e.g., ExifTool by Phil Harvey](https://exiftool.org/#download)
    * **License Link:** [Link to the ExifTool license, typically a Perl Artistic License]
    * **Downloaded File:** `Image-ExifTool-[version].zip` (Windows version is usually a zip containing `exiftool(-k).exe`)
    * **Downloaded File Path:** `C:\Users\unico\Downloads` (Example)
    * **Installation Date:** [YYYY-MM-DD]
    * **Folder Path:** `C:\Program Files (x86)\ExifTool` (Example - create this folder and place `exiftool.exe` inside if adding to PATH)
    * **Installation Steps:**
        1.  Unzip the downloaded file.
        2.  Rename `exiftool(-k).exe` to `exiftool.exe`.
        3.  Consider adding the directory containing `exiftool.exe` to your User or System PATH to run it from any command prompt location.
    * **Notes:** A powerful command-line tool for metadata manipulation. Adding its directory to PATH is highly recommended for ease of use.