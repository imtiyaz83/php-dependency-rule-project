#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <dependency1> <dependency2> ..."
    exit 1
fi

# Create a new composer.json file
echo '{ "require": {' > dependencies/composer.json

# Loop through all provided arguments
for dep in "$@"; do
    echo "    \"$dep\": \"*\"," >> dependencies/composer.json
done

# Remove the last comma and close the JSON object
sed -i '$ s/,$//' dependencies/composer.json
echo '}}' >> dependencies/composer.json

echo "Created dependencies/composer.json"

