
# Description: This PowerShell script reads the Activity directory, iterates through all files, 
#              and removes any parentheses with numbers (e.g., (1), (2)) from the filenames. 
#              It also normalizes hyphens and trims any remaining whitespace.

# Script Name: rename_remove_parentheses.ps1

# Retrieves the base path from 'current_dir.md' and stores it as a variable, removing trailing newline.
$basePathTemp = (Get-Content -Path "current_dir.md" -Raw).Trim()

# Define the relative path to the Activity folder
$activityRelativePath = "My_Projects\Project_Gemini\Implemented_Structures\Activity"

# Combine the base path with the relative path to get the full path to the Activity folder
$activityFolder = Join-Path $basePathTemp -ChildPath $activityRelativePath 

# Get all files in the Activity folder
Get-ChildItem -Path $activityFolder -File | ForEach-Object {
    # Remove trailing (number)
    $newName = $_.Name -replace " \(\d+\)$", ""  
    # Remove (number) anywhere in the name
    $newName = $newName -replace " \(\d+\)", "" 
    # Remove (number) anywhere in the name, even without preceding space
    $newName = $newName -replace "\(\d+\)", "" 
    # Replace multiple hyphens with a single hyphen
    $newName = $newName -replace "-{2,}", "-" 
    # Remove leading/trailing hyphens or spaces (but keep underscores)
    $newName = $newName -replace "^[- ]+|-+$" 
    # Remove any remaining leading/trailing whitespace
    $newName = $newName.Trim() 

    # Only rename if the name has changed
    if ($_.Name -ne $newName) { 
        Rename-Item -Path $_.FullName -NewName $newName #-WhatIf # Use -WhatIf first!
    }
}
