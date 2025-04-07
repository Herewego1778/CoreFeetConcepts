# Description: This PowerShell script reads from 'current_dir.md', creates file paths to the metadata
#              templates, copies the templates, and saves a copy to the 'Implemented_Structures\Activity' folder.
#              It imports a logging function to log the file copy operation.

# Script Name: copy_metadata_template.ps1

# Import the log function found inside log_message.ps1
. ".\log_message.ps1"

# Retrieves the base path from 'current_dir.md' and stores it as a variable, removing trailing newline
$basePathTemp = (Get-Content -Path "current_dir.md" -Raw).Trim()

# Define the metadata relative path
$metadataPath = Join-Path $basePathTemp -ChildPath "My_Projects\Project_Gemini\Metadata_Templates"

# Define the path to the Activity folder where the templates will be copied
$activityPath = Join-Path $basePathTemp -ChildPath "My_Projects\Project_Gemini\Implemented_Structures\Activity"

# Display the metadata path and activity path
Write-Host "Metadata Path: $metadataPath"
Write-Host "Activity Path: $activityPath"

# Check if the source file exists
Write-Host "Checking if source file exists: $(Test-Path -Path "$metadataPath\metadata_template_core_data.yml")"

# Copy the specific template found in the Metadata_Templates folder to the Activity folder
Copy-Item -Path "$metadataPath\metadata_template_core_data.yml" -Destination "$activityPath\metadata_template_core_data.yml"

# Log the file copy operation
Log-Message "Templates copied to the Activity folder." "PowerShell"
