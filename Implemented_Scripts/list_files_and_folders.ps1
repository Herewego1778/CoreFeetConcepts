# Description: This PowerShell script retrieves the names of all files and folders in the current 
#              directory and writes them to 'CurrentList.md'.

# Script Name: list_files_and_folders.ps1

# Gets the current directory this script is saved in
$directory = Get-Location

# Retrieve all file and folder names from the current directory and place them into an array, sorted
$items = Get-ChildItem -Path $directory | Select-Object -ExpandProperty Name | Sort-Object

# To get all files and subfolders in sorted order use the code below
# $items = Get-ChildItem -Path $directory -Recurse | Select-Object -ExpandProperty FullName | Sort-Object


# Iterate through each item in the array and write its name to 'CurrentList.md'
foreach($item in $items) {
    Add-Content -Path "CurrentList.md" -Value $item
}

