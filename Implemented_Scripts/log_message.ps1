# Description: This PowerShell script defines a function to log messages to a command_log.md 
#              file located in a subdirectory. The function can be imported by other scripts 
#              to log messages during execution.

# Script Name: log_message.ps1

# Function to log messages. You can import this file using ."/log_message.ps1"
function Log-Message {
    param(
        [string]$Message,            # Message to be logged
        [string]$Type = "Information" # Type of message (default is "Information")
    )
    
    # Get the current timestamp in the format "yyyy-MM-dd HH:mm:ss"
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Format the log entry with the timestamp, message type, and message
    $LogEntry = "[$Timestamp] [$Type] $Message"

    # Append the log entry to the command_log.md file (create the file if it doesn't exist)
    Add-Content -Path "$basePathTemp\command_log.md" -Value $LogEntry
    
    # Display the log entry to the console as well
    Write-Host $LogEntry
}
