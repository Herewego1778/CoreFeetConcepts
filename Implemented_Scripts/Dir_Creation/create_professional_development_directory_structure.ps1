# Description: This PowerShell script creates a directory structure for storing professional development materials. 
#              It handles path validation and can automate the creation of multiple README.md files. 
# Script Name: create_professional_development_directory_structure.ps1

$folders = @(
    "Certifications\CompTIA_A+\Study_Guides",
    "Certifications\CompTIA_A+\Practice_Exams",
    "Certifications\CompTIA_A+\Resources",
    "Certifications\CompTIA_A+\Objectives.md",
    "Career_Roadmaps\IT_Administrator\Software_Developer_Career_Path.md",
    "Career_Roadmaps\Software_Developer\IT_Administrator_Career_Path.md",
    "README.md"
)

# Loop through each item in the $folders array
foreach ($item in $folders) {

    # Extract the parent directory path from the current item
    # Handle empty strings to ensure no errors occur
    $parentDir = Split-Path -Path $item -Parent
    if (-not [string]::IsNullOrEmpty($parentDir)) { # Check if the extracted parent directory path is not empty

        # Check if the parent directory does not already exist
        if (-not (Test-Path -Path $parentDir -PathType Container)) {
            # Create the parent directory if it does not exist
            New-Item -ItemType Directory -Path $parentDir | Out-Null
            # Output a message to indicate the creation of the parent directory
            Write-Host "Created directory: $parentDir"
        }
    }

    # Check if the current item (file or directory) does not already exist
    if (-not (Test-Path -Path $item)) {
        # Determine if the item is a file (based on its extension) and create it
        if ($item.EndsWith(".md") -or $item.EndsWith(".py") -or $item.EndsWith(".ps1")) {
            New-Item -ItemType File -Path $item | Out-Null
            # Output a message to indicate the creation of the file
            Write-Host "Created file: $item"
        } else {
            # If the item is not a file, assume it's a directory and create it
            New-Item -ItemType Directory -Path $item | Out-Null
            # Output a message to indicate the creation of the directory
            Write-Host "Created directory: $item"
        }
    } else {
        # Output a message to indicate that the item already exists
        Write-Host "Item '$item' already exists."
    }
}

# Output a final message to indicate the script has completed its execution
Write-Host "Script completed."