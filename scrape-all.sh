#!/bin/bash

# Function to loop through files recursively
function process_files {
  local folder="$1"   # Folder to process

  # Loop through files and folders in the current folder
  for item in "$folder"/*; do
    if [[ -f "$item" ]]; then     # Check if item is a file
      if [[ "$item" == *.js ]]; then    # Check if it's a JavaScript file
        node "$item"    # Run `node` command for the JavaScript file
      fi
    elif [[ -d "$item" ]]; then    # Check if item is a directory
      process_files "$item"    # Recursively call the function for subfolders
    fi
  
  done
}

# Start processing files from the specified folder
process_files "sources"