# Description: This PowerShell script takes an array of folder names and creates the specified 
#              directory structure. It can also automate the creation of multiple README.md files 
#              and handles path validation.
# Script Name: create_dir_directory_structure.ps1
# TutorialID: CoreFeetConcept-PS-SCRIPT-03

$folders = @(
    "README.md",
    "Books",
    "Definitions",
    "Equipment_Notes",
    "Glossary",
    "Hybrid_Remote",
    "Insights",
    "Interaction_Notes",
    "On_Location",
    "Online_Courses",
    "My_Projects",
    "Professional_Development",
    "Public_Portfolio",
    "Tools_And_Applications",
    "Tutorials"
)
  # Create the folders (and files)
  foreach ($item in $folders) {
      # Get the parent directory (handle empty string)
      $parentDir = Split-Path -Path $item -Parent
      if (-not [string]::IsNullOrEmpty($parentDir)) { # Check if $parentDir is not empty
          # Create the parent directory if it doesn't exist
          if (-not (Test-Path -Path $parentDir -PathType Container)) {
              New-Item -ItemType Directory -Path $parentDir | Out-Null
              Write-Host "Created directory: $parentDir"
          }
      }


      # Now create the file or folder
      if (-not (Test-Path -Path $item)) {
          if ($item.EndsWith(".md") -or $item.EndsWith(".py") -or $item.EndsWith(".ps1")) {
              New-Item -ItemType File -Path $item | Out-Null
              Write-Host "Created file: $item"
          } else {
              New-Item -ItemType Directory -Path $item | Out-Null
              Write-Host "Created directory: $item"
          }
      } else {
          Write-Host "Item '$item' already exists."
      }
  }

  Write-Host "Script completed."