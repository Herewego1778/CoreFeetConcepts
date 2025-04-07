# Description:  This script processes YAML files from the Activity folder, verifies FilePath keys, 
#               validates combined paths, and moves files to the correct locations if necessary.
# Script Name: organize_yaml_files.ps1
# TutorialID: CoreFeetConcept-PS-SCRIPT-014

# Import the log function found inside log_function_powershell.ps1
. ".\log_function_powershell.ps1"

# Import the Check-PathLength function found inside check_path_length.ps1
. ".\check_path_length.ps1"

# Retrieves the base path from 'current_dir.md' and stores it as a variable, removing trailing newline.
$basePathTemp = (Get-Content -Path "current_dir.md" -Raw).Trim()

# Relative path to the Activity folder where the files are that need to be renamed.
$activityRelativePath = "My_Projects\CoreFeetConcepts\Implemented_Structures\Activity"

# Join the path $activityRelativePath to $basePathTemp.
$activityFolder = Join-Path $basePathTemp -ChildPath $activityRelativePath 

# Gets an array of all YAML file names within the 'Activity' folder.
$allFiles = Get-ChildItem -File $activityFolder -Filter "*.yml" -Force | Select-Object -ExpandProperty Name

foreach ($file in $allFiles) {

    # Creates the full path to the current YAML file.
    $yamlPath = Join-Path $activityFolder -ChildPath $file

    #region Read and Convert YAML
    # Reads the YAML file content and converts it to a PowerShell object.
    try {
        # Reads the YAML file content.
        $yamlContent = Get-Content $yamlPath -Raw -ErrorAction Stop

        # Checks if the file is empty or contains only whitespace.
        if ([string]::IsNullOrWhiteSpace($yamlContent)) {
            Write-Host "Warning: YAML file '$file' is empty or contains only whitespace."
            continue # Skips to the next file.
        }

        # Converts the YAML content to a PowerShell object.
        try {
            $yamlObject = ConvertFrom-Yaml $yamlContent -ErrorAction Stop
        }
        catch {
            Write-Host "Warning: YAML file '$file' has invalid YAML syntax and could not be parsed."
            continue # Skips to the next file.
        }
        #endregion

        # Extracting relevant keys from the YAML object.
        $filePath = $yamlObject.FilePath

        # Check if $saveFilePath has a value before proceeding.
        if ([string]::IsNullOrEmpty($filePath)) {
            Write-Host "Warning: FilePath key is empty. Skipping."
            continue
        }

        # Join the $filePath value to the base path of the entire file tree.
        $saveFilePath = Join-Path $basePathTemp -ChildPath $filePath

        # Check if $saveFilePath resolves to a valid path.
        if ([string]::IsNullOrEmpty($saveFilePath) -or !(Test-Path -Path $saveFilePath)) {
            Write-Host "Warning: File '$filePath' does not resolve to a valid path. Skipping."
            continue
        }

        # Add the file name to the end of the absolute path stored in $saveFilePath.
        $newFilePath = Join-Path $saveFilePath -ChildPath $file

        if (Check-PathLength $saveFilePath) {
            if (Test-Path -Path $newFilePath) {
                Write-Host "Path exists."
            } else {
                Move-Item -Path $yamlPath -Destination $newFilePath
                Log-Message "$file moved to $filePath" "PowerShell"
            }
        }

    } catch {
        # Error handling: Determines if the error was caused by a specific YAML file or another issue.
        if ($_.Exception.Source -like "*$yamlPath*") {
            Write-Host "Error reading YAML file '$yamlPath': $($_.Exception.Message)"
        } else {
            Write-Host "Error reading file: $($_.Exception.Message)" # Default message
        }
    }
}
