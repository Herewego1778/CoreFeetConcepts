# Description: This PowerShell script retrieves the base path from 'current_dir.md', recursively 
#              collects all folder paths, and writes them to 'master_index.md' located in the 
#              'My_Projects\CoreFeetConcepts' folder.

# Script Name: create_master_index.ps1

# Retrieves the base path and stores it as a variable, removing trailing newline
$basePathTemp = (Get-Content -Path "current_dir.md" -Raw).Trim()

# Creates the file master_index.md other scripts will read from
$resultsData = "\My_Projects\CoreFeetConcepts\master_index.md"

# Use Join-Path to combine the root directory and the relative path to master_index.md
$outPath = Join-Path $basePathTemp -ChildPath $resultsData

# Initialize an empty array to store folder paths
$folderPaths = @()

# Get all folders recursively from the base path
$folders = Get-ChildItem -Path $basePathTemp -Recurse -Directory

# Iterate through the folders and add their full paths to the array and strip everything
# left of the base path, CS_Knowledge_Base directory
foreach ($folder in $folders) {
    $folderPaths += $folder.FullName.Substring("$basePathTemp\".Length)
}

# Sort the array of folder paths
$folderPaths = $folderPaths | Sort-Object

# Output the array to the master_index.md file
$folderPaths | Out-File -FilePath $outPath -Encoding UTF8
