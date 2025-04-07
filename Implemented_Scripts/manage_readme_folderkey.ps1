# Description: This PowerShell script manages the "FolderKey" metadata in README.md files 
#              throughout a directory tree. It reads a key-value mapping from the 
#              folder_key_index.md file, where each key is a folder path and each value is 
#              the corresponding "FolderKey". The script then updates or creates README.md 
#              files in each folder, adding the "FolderKey" metadata section. The 
#              "My_Projects\CoreFeetConcepts" folder and its subfolders are excluded from 
#              processing.
# Script Name: manage_readme_folderkey.ps1
# TutorialID: "TUT-PS-SCRIPT-001"

# Retrieves the base path and stores it as a variable, removing trailing newline
$basePathTemp = (Get-Content -Path "current_dir.md" -Raw).Trim()

# Check if the variable is empty or null
if ([string]::IsNullOrEmpty($basePathTemp)) {
    Write-Host "Base path is empty or null. Exiting."
    return # Exit the script
}

# Test if the path exist
if (-not (Test-Path -Path $basePathTemp -PathType Container)) {
    Write-Host "Base path does not exist. Exiting."
    return # Exit the script
}

# List of folders in the entire directory of CS_Knowledge_Base, add the -Recurse parameter
$entireDirectory = Get-ChildItem -Directory -Path $basePathTemp -Recurse

# Name of the output file
$outputFile = "README.md"

# Name of the FolderKey index file
$folderKeyMd = "folder_key_index.md"

# Avoid this entire relative path
$avoidPaths = Join-Path $basePathTemp -Child "My_Projects\CoreFeetConcepts"

# **New: Correct base path for folder_key_index.md**
$folderKeyBasePath = $avoidPaths

# Delimiter used to seperate relative paths and FolderKey indexes
$delimiter = ":"

# Empty table for key: value pairs
$folderKeyArray = @{}

# Construct the full path to folder_key_index.md**
$folderKeyFullPath = Join-Path -Path $folderKeyBasePath -ChildPath $folderKeyMd


# Access folder_key_index.md retrieve the FolderKey assigned to relative paths
try {
    # Read
    $contentFolderKey = Get-Content -Path $folderKeyFullPath -ErrorAction Stop
    foreach ($line in $contentFolderKey) {
        $values = $line -split $delimiter
        # Add each value as key: value pairs inside the hash table
        $folderKeyArray.Add($values[0].Trim(), $values[1].Trim()) # Remove any leading or trailing spaces when we add the keys and values
    }
    # Sort the keys by length in descending order
    $sortedKeys = $folderKeyArray.Keys | Sort-Object -Descending -Property Length
}
catch {
    <#Do this if a terminating exception happens#>
    if ($_.Exception.Source -like $folderKeyFullPath) {
        Write-Host "Error reading file '$folderKeyFullPath': $($_.Exception.Message)"
    } else {
        Write-Host "Error reading file: $($_.Exception.Message)" # Default message
    }
}

# Process the README.md in the base directory
$baseReadmePath = Join-Path -Path $basePathTemp -ChildPath $outputFile
# Initialize $addContent to an empty string
$addContent = ""
if (Test-Path $baseReadmePath) {
    try {
        Set-Content -Path $baseReadmePath -Value $addContent -Encoding UTF8
        $relativePath = $baseReadmePath.Substring($basePathTemp.Length)
        Write-Host "File successfully rewritten: $relativePath"
    } catch {
        Write-Host "An error occurred: $($_.Exception.Message)"
    }
} else {
    try {
        $addContent | Out-File -FilePath $baseReadmePath -Encoding UTF8
        $relativePath = $baseReadmePath.Substring($basePathTemp.Length)
        Write-Host "File successfully created: $relativePath"
    } catch {
        Write-Host "An error occurred: $($_.Exception.Message)"
    }
}

# Process the README.md in subdirectories
foreach ($folder in $entireDirectory) {
    # Join the README.md file name to the path
    $readmePath = Join-Path -Path $folder.FullName -ChildPath $outputFile

    # Check if the folder is within the avoid path
    if ($folder.FullName.StartsWith($avoidPaths)) {
        continue
    }

    # Initialize $addContent to an empty string
    $addContent = ""

    # Create the content for the relative path that matches a key inside the $folderKeyArray
    # Loop through the sorted keys
    foreach ($key in $sortedKeys) {
        # Use -like for substring matching
        if ($folder.FullName.EndsWith($key)) {
            $addContent = @"
---
FolderKey: "$($folderKeyArray[$key])" # Unique key
---
"@
            # Break out of the inner loop once a match is found
            break
        }
    }
    # If no match was found, set a default value
    if ([string]::IsNullOrEmpty($addContent)) {
        $addContent = @"
---
FolderKey: "NO-KEY-FOUND" # Unique key
---
"@
    }

    # Check if the README.md exist, rewrite the file
    if (Test-Path $readmePath) {
        try {
            # Rewrite the file with the new content
            Set-Content -Path $readmePath -Value $addContent -Encoding UTF8
            $relativePath = $readmePath.Substring($basePathTemp.Length)
            Write-Host "File successfully rewritten: $relativePath"
        } catch {
            Write-Host "An error occurred: $($_.Exception.Message)"
        }
    } else {
        try {
            # Now create the file with the content
            $addContent | Out-File -FilePath $readmePath -Encoding UTF8
            $relativePath = $readmePath.Substring($basePathTemp.Length)
            Write-Host "File successfully created: $relativePath"
        } catch {
            Write-Host "An error occurred: $($_.Exception.Message)"
        }
    }
}

Write-Host "Script completed."
