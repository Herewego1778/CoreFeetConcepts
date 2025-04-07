# Description: This PowerShell script defines a function to check if a file path's length 
#              is within the recommended limit for Windows systems. If the path exceeds 
#              the limit, it logs an error message and returns $false.

# Script Name: check_path_length.ps1

# This script is intended to be imported into other scripts
# Ensure to also import the log_message.ps1 file for the Log-Message function

# Function to check if a file path length exceeds the Windows limit
function Check-PathLength {
    param(
        [string]$Path # Path to be checked
    )
    
    # Check if the length of the path is greater than 248 characters (leaving room for filename)
    if ($Path.Length -gt 248) { 
        # Log an error message if the path length exceeds the limit
        Log-Message "Path '$Path' exceeds the recommended length (248 characters). Please shorten." -Type "Error"
        
        # Return false indicating the path length exceeds the limit
        return $false
    }
    
    # Return true indicating the path length is within the limit
    return $true
}
