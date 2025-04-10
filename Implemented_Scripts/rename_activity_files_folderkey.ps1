# Description: This script is specifically designed for use within the Implemented_Structures\Activity folder. This script 
#              processes YAML files, extracts folder paths from the FilePath metadata, and renames the file according to the 
#              name of the folder it is to be stored in or the FolderKey metadata found in the README within the intended folder.
# Script Name: rename__activity_files_folderkey.ps1
# TutorialID: CoreFeetConcept-PS-SCRIPT-009

#region ConstructBaseActivityPath
# Try to retrieve the base path from 'current_dir.md' and store it as a variable, removing trailing newline.
try {
    $basePath = (Get-Content -Path "current_dir.md" -Raw).Trim()
    # Check if the variable is empty, null, or has whitespace
    if ([string]::IsNullOrWhiteSpace($basePath)) {
        Write-Host "Base path is empty or null. Exiting."
        return # Exit the script
    }
}
catch {
    Write-Host "Error reading file: $($_.Exception.Message)" # Default message
}

# Test if the base path exists and is a container (directory).
if (-not (Test-Path -Path $basePath -PathType Container)) {
    Write-Host "Base path does not exist. Exiting."
    return # Exit the script
}

# Store the relative path to Activity folder in a variable.
$activityVarPath = "My_Projects\CoreFeetConcepts\Implemented_Structures\Activity"

# Construct the full path to the Activity folder.
$activityPath = Join-Path -Path $basePath -ChildPath $activityVarPath

# Check if the Activity folder exists. Exit if it doesn't.
if (-not (Test-Path $activityPath)) {
    Write-Warning "The Activity folder does not exist. Exiting."
    return;
}
#endregion ConstructBaseActivityPath

#region twoCustomFunctions
# This function takes the given folder path, joins the path to README.md, and extracts the FolderKey metadata stored inside the README

# Default folder name (4 characters) this is use inside the read_readme_metadata
$defaultFolder = "ault"
function read_readme_metadata {
    param (
        [string]$folderPath, # Folder path
        [string]$readmeFileName = "README.md" # Default README filename
    )

    try {
        # Try to join the paths passed into the function
        $readmePath = Join-Path -Path $folderPath -ChildPath $readmeFileName
        # Test if the path exist
        if (Test-Path -Path $readmePath) {
            # Retrieve the content stored inside the README
            $readmeContent = Get-Content -Path $readmePath -Raw
            # If the README contains the headers "--- FolderKey: ---", extract the metadata value
            if ($readmeContent -match '(?s)---(.*?)---') {
                $yamlHeader = $Matches[1] # Store the value of the matching key
                try {
                    $readmeMetadata = $yamlHeader | ConvertFrom-Yaml # Convert the value into a YAML object
                } catch {
                    Write-Warning "Error parsing YAML in README.md in folder '$folderPath': $($_.Exception.Message)"
                    # Handle the error appropriately, e.g.,
                    # $readmeMetadata = @{} # Or some default value
                    return $defaultFolder
                }
                if (-not [string]::IsNullOrWhiteSpace($readmeMetadata.FolderKey)) {
                    # Extract the FolderKey metadata
                    $folderKey = $readmeMetadata.FolderKey
                    # Extract the last four characters of the FolderKey metadata and return
                    return $folderKey.Substring($folderKey.Length - 3).ToLower()
                }
            }
        }

        # If README doesn't exist or FolderKey is empty, use folder's leaf
        $folderKey = Split-Path -Path $folderPath -Leaf
        if (-not [string]::IsNullOrWhiteSpace($folderKey)) {
            # Lowercase the string and extract the first four characters
            return $folderKey.Substring(0, 4).ToLower()
        } else {
            return $defaultFolder # Return default folder name
        }

    }
    catch {
        Write-Warning "Error reading README or processing folder: $($_.Exception.Message)"
        return $defaultFolder # Return default on error
    }
}

# This function checks if the FolderKey is already integrated into the file name, if not it formarts the new file name, and renames the current file
function rename_file {
    param (
        [string]$filePath,
        [string]$fileName,
        [string]$fileExtension,
        [string]$folderKey
    )

    try {
        # Check if the file name already contains the folder key, if it does not enter the if block
        if ($fileName -notlike "*_$folderKey") {
            # Format the file name with the given folder key, add underscore, and file extension
            $newFileName = "$fileName`_$folderKey$fileExtension"

            # Rename the given file path to the new file name
            Rename-Item -Path $filePath -NewName $newFileName

            #...
            Write-Host "Renamed $filePath to $newFileName"
        } else {
            # If the file name already contains the folder key, prompt the user
            Write-Warning "File '$fileName$fileExtension' already contains folder key '$folderKey'. Skipping."
        }
    } catch {
        # Prompt the user on failure to rename
        Write-Warning "Failed to rename $filePath`: $($_.Exception.Message)"
    }
}
# Get the FilePath metadata from a YAML file
function get_content_yaml_metadata {
    param (
        [string]$yamlPath,
        [string]$basePath
    )

    try {
        # Try to read the entire file of the current file path stored in $yamlPath. YAML files are text-based, To process them, you first need to read the text
        $yamlContent = Get-Content $yamlPath -Raw -ErrorAction Stop

        # If the content of the current file is empty or contains white space, the function returns FALSE
        if ([string]::IsNullOrWhiteSpace($yamlContent)) {
            # Prompt the user of a error
            Write-Warning "YAML file '$(Split-Path -Leaf $yamlPath)' is empty or contains only whitespace."
            return $false # Return false on error
        }

        # Proceed to convert the contents of the file into a YAML Object
        $yamlObject = ConvertFrom-Yaml $yamlContent -ErrorAction Stop

        # If the extract FilePath metadata key has a value continue to join the path, test the path, and return a value 
        if ($yamlObject.FilePath) {
            # Join the relative path stored in the FilePath metadata key to the base path given to the function as $basePath
            $absoluteFolderPath = Join-Path -Path $basePath -ChildPath $yamlObject.FilePath

            # If path stored in $absoluteFolderPath does exist, return the absolute path or FALSE
            if (Test-Path -Path $absoluteFolderPath) {
                return $absoluteFolderPath # Return the absolute path
            } else {
                # Prompt the user of a error
                Write-Warning "Path in file: '$(Split-Path -Leaf $yamlPath)' does not exist."
                return $false # Return FALSE if the folder path does not exist
            }
        } else {
            # If not FilePath metadata key is found, prompt the user of the error
            Write-Warning "FilePath metadata key not found in '$(Split-Path -Leaf $yamlPath)'."
            return $false # Return FALSE if no FilePath metadata key is found
        }
    } catch {
        Write-Warning "Error processing YAML file '$yamlPath': $($_.Exception.Message)"
        return $false # Return false on error
    }
}
#endregion twoCustomFunctions

#region beginForLoopDirectory
# Get all files in the Activity folder
#region beginForLoopDirectory
# Get all files in the Activity folder
$files = Get-ChildItem -Path $activityPath -File

# Loop through all the files retrieved in $files
foreach ($file in $files) {
    # Creates the full path to the current YAML file
    $yamlPath = Join-Path $activityPath $file.Name  # Join path FIRST
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($file) # Get filename without extension
    $fileExtension = [System.IO.Path]::GetExtension($file).ToLower()  # Get file extension

    if ($fileExtension -in (".yml", ".yaml")) {
        try {
            # Verify the relative path inside the current file
            $absoluteFolderPath = get_content_yaml_metadata -yamlPath $yamlPath -basePath $basePath

            if ($absoluteFolderPath) {
                # Create a folder key
                $currentFolderKey = read_readme_metadata -folderPath $absoluteFolderPath

                # Call the rename function
                rename_file -filePath $yamlPath -fileName $fileName -fileExtension $fileExtension -folderKey $currentFolderKey
            }
        } catch {
            Write-Warning "Failed to process YAML: $($file.FullName) - $($_.Exception.Message)"
        }
    } else {
        Write-Host "Skipping non-YAML file: $yamlPath (Extension: $fileExtension)"
    }
}

#endRegion

