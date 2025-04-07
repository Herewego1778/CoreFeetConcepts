"""
Description: This Python script defines a function to log messages with a timestamp and type to a 
             log file. It is intended to be imported and used by other scripts.

Script Name: log_message.py
"""

import datetime
import os

def log_message(message, log_type="Information", base_path_temp="."):
    """
    Logs a message with a timestamp and type to a log file.

    Args:
        message (str): The message to log.
        log_type (str, optional): The type of log entry (e.g., "Information", "Warning", "Error"). Defaults to "Information".
        base_path_temp (str, optional): The base path where the log file will be created. Defaults to the current directory.
    """
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_entry = f"[{timestamp}] [{log_type}] {message}"

    log_file_path = os.path.join(base_path_temp, "command_log.md")

    try:
        with open(log_file_path, "a") as log_file:
            log_file.write(log_entry + "\n")
        print(log_entry)  # Display to console
    except Exception as e:
        print(f"Error writing to log file: {e}")

if __name__ == "__main__":
    # Example usage (only executed if this script is run directly)
    log_message("This is a test log message.", "Debug", ".") # log to current directory
    log_message("Another test message","Warning", "./testfolder") # log to ./testfolder

