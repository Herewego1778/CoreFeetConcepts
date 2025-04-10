# Description: This PowerShell script reads the Activity directory, iterates through all files,
#              and replaces any spaces in the filenames with underscores. It starts by reading 
#              the base directory from 'current_dir.md' and then processes the relative path to 
#              the 'Activity' folder.

# Script Name: rename_files_with_underscores.ps1

# Retrieves the base path from 'current_dir.md' and stores it as a variable, removing trailing newline.
$basePathTemp = (Get-Content -Path "current_dir.md" -Raw).Trim()

# Define the relative path to the Activity folder
$activityRelativePath = "My_Projects\CoreFeetConcepts\Implemented_Structures\Activity"

# Combine the base path with the relative path to get the full path to the Activity folder
$activityFolder = Join-Path $basePathTemp -ChildPath $activityRelativePath 

# Get all files in the Activity folder, sorted by FullName
$files = Get-ChildItem $activityFolder -File | Sort-Object FullName

# Iterate through each file in the $files array
foreach ($item in $files) {
    $filename = $item.Name     # Retrieve the name of the file
    $extension = $item.Extension # Retrieve the file extension
    
    # Split the filename into words by spaces
    $words = $filename.Split(" ")

    # Initialize an empty string to hold the new filename
    $result = ""

    # Iterate through each word in the $words array
    foreach ($word in $words) {
        if ($word.Length -gt 0) {
            # Convert the word to lowercase and add an underscore
            $result += $word.ToLower() + "_"
        }
    }

    # Remove the trailing underscore from the result string
    $result = $result.TrimEnd("_")

    # Append the extension to the result string if it's not already there
    if (-not $result.EndsWith($extension)) {
        $result += $extension
    }

    # Combine the new filename with the path to the Activity folder
    $new_path = Join-Path -Path $activityFolder -ChildPath $result

# Check if the new filename already exists
# If it does, generate a unique filename by adding an incrementing number (e.g., file_name(1))
if (Test-Path $new_path) {
    $counter = 1
    do {
        # Generate a new path with an incrementing number appended to the filename
        $unique_path = Join-Path -Path $activityFolder -ChildPath ("{0} ({1}){2}" -f $result.Replace($extension, ""), $counter, $extension)
        $counter++
    } until (-not (Test-Path $unique_path)) # Continue until a unique filename is found
    # Set the new path to the unique path
    $new_path = $unique_path
}

    # Rename the file to the new filename
    Rename-Item $item.FullName $new_path #-WhatIf # Use -WhatIf first!
}
