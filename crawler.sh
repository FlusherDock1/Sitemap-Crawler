#!/bin/bash

# Function to download and process sitemap
process_sitemap() {
  local SITEMAP_URL=$1

  # Temporary file to store the downloaded sitemap
  local TEMP_FILE=$(mktemp)

  # Download the sitemap.xml
  curl -s $SITEMAP_URL -o $TEMP_FILE

  # Check if the sitemap was downloaded successfully
  if [[ ! -s $TEMP_FILE ]]; then
    echo "Failed to download sitemap from $SITEMAP_URL"
    rm $TEMP_FILE
    return
  fi

  # Parse the sitemap.xml and extract URLs and nested sitemaps
  local URLS=$(grep -oP '(?<=<loc>)[^<]+' $TEMP_FILE)
  local SITEMAPS=$(grep -oP '(?<=<sitemap>).*?(?=</sitemap>)' $TEMP_FILE | grep -oP '(?<=<loc>)[^<]+')

  # Process each URL found in the sitemap
  for URL in $URLS; do
    echo "Opening $URL"
    # Here you can use any command to "open" the URL.
    # For example, using curl to fetch the page content:
    curl -s $URL > /dev/null

    # Or to actually open it in the default web browser (uncomment if desired):
    # xdg-open $URL
  done

  # Recursively process nested sitemaps
  for NESTED_SITEMAP in $SITEMAPS; do
    process_sitemap $NESTED_SITEMAP
  done

  # Clean up the temporary file
  rm $TEMP_FILE
}

# Main script starts here
# URL to the main sitemap.xml
MAIN_SITEMAP_URL="https://example.com/sitemap.xml"

# Start processing the main sitemap
process_sitemap $MAIN_SITEMAP_URL

echo "All URLs processed."
