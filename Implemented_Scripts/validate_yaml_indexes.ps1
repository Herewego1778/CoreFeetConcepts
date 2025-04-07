# Description: This script validates YAML files against master and categorized index files,
#              ensuring file names, file paths, and categories are correctly referenced.
# Script Name: validate_yaml_indexes.ps1
# TutorialID: CoreFeetConcept-PS-SCRIPT-013

# Try to retrieve the base path from 'current_dir.md' and store it as a variable, removing trailing newline.
try {
    $basePathTemp = (Get-Content -Path "current_dir.md" -Raw).Trim()
    # Check if the variable is empty, null, or has whitespace
    if ([string]::IsNullOrWhiteSpace($basePathTemp)) {
        Write-Error "Base path is empty or null. Exiting."
        return # Exit the script
    }
}
catch {
    Write-Error "Error reading file: $($_.Exception.Message)" # Default message
}

# Test if the base path exists and is a container (directory).
if (-not (Test-Path -Path $basePathTemp -PathType Container)) {
    Write-Error "Base path does not exist. Exiting."
    return # Exit the script
}

# Joins the relative path of the 'Implemented_Structures' folder to the base path
# This allows reading from 'categorized_index.md' and 'master_index.md', which are expected to be read-only
$implementedStruct = Join-Path $basePathTemp -ChildPath "\My_Projects\CoreFeetConcepts\Implemented_Structures"

# Defines the full paths to the index files and the directory containing the YAML files
$yamlIndexPath = Join-Path $implementedStruct -ChildPath "Activity"
$masterIndexPath = Join-Path $implementedStruct -ChildPath "master_index.md"
$categorizedIndexPath = Join-Path $implementedStruct -ChildPath "categorized_index.md"

$delimiter = ":"  # Delimiter used in 'categorized_index.md'

#region Read Index Files
try {
    # Reads 'master_index.md' and stores each line as an element in the '$masterArray'
    $contentMaster = Get-Content -Path $masterIndexPath -ErrorAction Stop
    $masterArray = @($contentMaster) # More concise way to create the array

    # Reads 'categorized_index.md', splits each line by the delimiter, and stores the second part (category) in '$categorizedArray'
    $contentCategorized = Get-Content -Path $categorizedIndexPath -ErrorAction Stop
    $categorizedArray = $contentCategorized | ForEach-Object { $_ -split $delimiter | Select-Object -Last 1 }  # More concise way to create the array
}
catch {
    # Error handling: determines which file caused the error
    if ($_.Exception.Source -like "*master_index.md*") {
        Write-Error "Error reading file '$masterIndexPath': $($_.Exception.Message)"
    } elseif ($_.Exception.Source -like "*categorized_index.md*") {
        Write-Error "Error reading file '$categorizedIndexPath': $($_.Exception.Message)"
    } else {
        Write-Error "Error reading file: $($_.Exception.Message)" # Default message
    }
    exit  # Terminate the script if index files can't be read
}
#endregion

# Retrieve all files from the Activity folder
$files = Get-ChildItem -Path $yamlIndexPath -File -Force
# Initialize a empty array to store the files that have the matching extensions
$allFiles = @()

# Loop through all the files retrieved in $files
foreach ($file in $files) {
    # Now all files with the extensions .yml and .yaml will be stored in the array $allFiles
    if ($file.Extension -in (".yml", ".yaml")) {
        $allFiles += $file.Name
    }
}
#region Process YAML Files

# Iterates through each YAML file to validate its contents against the index files
foreach ($file in $allFiles) {

    # Creates the full path to the current YAML file
    $yamlPath = Join-Path $yamlIndexPath -ChildPath $file

    #region Read and Convert YAML
    # Reads the YAML file content and converts it to a PowerShell object
    try {
        # Reads the YAML file content.
        $yamlContent = Get-Content $yamlPath -Raw -ErrorAction Stop

        # Checks if the file is empty or contains only whitespace
        if ([string]::IsNullOrWhiteSpace($yamlContent)) {
            Write-Warning "YAML file '$file' is empty or contains only whitespace."
            continue # Skips to the next file.
        }

        # Converts the YAML content to a PowerShell object
        try {
            $yamlObject = ConvertFrom-Yaml $yamlContent -ErrorAction Stop
        }
        catch {
            Write-Warning "YAML file '$file' has invalid YAML syntax and could not be parsed."
            continue # Skips to the next file.
        }
        #endregion

        # Extracting relevant keys from the YAML object
        $fileName = $yamlObject.FileName
        $filePath = $yamlObject.FilePath
        $category = $yamlObject.Category

        #region Check FileName
        # Checks if the file name in the YAML matches the actual file name
        if ($file -eq $fileName) {
            Write-Host "File Name: $fileName"
        }
        else{
            Write-Warning "File Name: $fileName Does not match $file"
        }
        #endregion

        #region Check FilePath Against Master Index
        # Normalizes the file path by replacing backslashes with forward slashes
        $normalizedFilePath = $filePath -replace '/', '\'

        # Checks if the normalized file path exists in the master index
        if ($masterArray -contains $normalizedFilePath) {
            Write-Host " - Matching master index path found: $normalizedFilePath"
        } else {
            Write-Warning " - No matching master index path found: $normalizedFilePath"
        }
        #endregion

        #region Check Category Against Categorized Index
        # Checks if any of the categories match the keys in the 'categorized_index.md'
        foreach ($key in $category) {
            $countMatches = 0 # Resets the match counter for each category
            foreach ($item in $categorizedArray) {
                 # Compare each key to every item in the category array

                if ($key.Trim() -eq $item) {
                    $countMatches++
                    Write-Host " - Matching value found: $item, $key"
                } elseif ([string]::IsNullOrWhiteSpace($key)) {
                    continue # Pass over empty strings 
                }
            }
            if ($countMatches -eq 0 -and $key -ne "") {
                Write-Warning " - No matches found for category : $key"
            }
            if ([string]::IsNullOrWhiteSpace($key)) {
                Write-Host " - Missing category value"
            }
        }
        #endregion

    }
    catch {
        # Error handling: determines if the error was caused by a specific YAML file or another issue
        if ($_.Exception.Source -like "*$yamlPath*") {
                Write-Error "Error reading YAML file '$yamlPath': $($_.Exception.Message)"
        } else {
            Write-Error "Error reading file: $($_.Exception.Message)" # Default message
        }
    }
}
#endregion
