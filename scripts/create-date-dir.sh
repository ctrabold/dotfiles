#!/bin/bash

# Iterate over all markdown files in the current directory
for file in *.md; do
  # Get the date from the filename (assuming it's in the format YYYY-MM-DD)
  date_str=$(basename "$file" | cut -d '.' -f1)

  # Create a folder for each unique date, if it doesn't exist already
  if [ ! -d "$date_str" ]; then
    mkdir -p "$date_str"
  fi

  # Move the markdown file to its corresponding folder
  mv "$file" "$date_str/"
done
