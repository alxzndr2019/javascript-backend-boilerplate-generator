#!/bin/bash

echo "========================"

# Set Git configurations
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace/

# Move to the GitHub workspace (where the repository is mounted)
cd /github/workspace/

node /app/index.js
# Create a text file with "Hello, World!"
echo "Hello, World!" > hello.txt

# Commit and push changes
git add -A && git commit -m "Add hello.txt with Hello, World!" && git push

echo "========================"
