#!/bin/bash

echo "========================"

# Set Git configurations
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace/MyProject

# Move to the GitHub workspace (where the repository is mounted)
cd /github/workspace/MyProject

# Run your script to generate the project structure
node /app/index.js

# Add some content to the files
find . -type f -exec sh -c 'echo "Initial content" > "{}"' \;

# Commit and push changes
git add -A && git commit -m "Generate boilerplate" && git push

echo "========================"
