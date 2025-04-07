# Description: This PowerShell script creates a file called 'current_dir.md' in the 
#              'My_Projects\CoreFeetConcepts' folder. This file stores the base path 
#              which other scripts will use to retrieve and combine file paths.

# Script Name: set_base_directory.ps1

# User must define the root path
$rootPath = "C:\Users\unico\Documents"

# User must define the name of the home directory
$homeDir = "CS_Knowledge_Base"

# Combine the home directory and root path
$dirPath = Join-Path -Path $rootPath -ChildPath $homeDir

# Add the relative path to CoreFeetConcepts where the output file will be saved to
$basePath = Join-Path -Path $dirPath -ChildPath "My_Projects\CoreFeetConcepts" # Removed leading and trailing \

# Check if the directory exists
if (-Not (Test-Path -Path $basePath -PathType Container)) {
    Write-Warning "Path: $basePath does not exist. Please ensure the directory structure is set up correctly."
    # You might also want to add a 'return' or 'exit' here to stop the script if the directory is crucial
    exit
}

# Save $dirPath to current_dir.md
$currentDirFile = Join-Path -Path $basePath -ChildPath "current_dir.md" # Path to the file
$dirPath | Out-File -FilePath $currentDirFile -Encoding UTF8 # Save with UTF8 encoding

Write-Host "Directory path saved to: $currentDirFile"
