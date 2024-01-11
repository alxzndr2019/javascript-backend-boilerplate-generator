#!/bin/bash

echo "========================"

# Set Git configurations
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Move to the GitHub workspace (where the repository is mounted)
cd /github/workspace

# Create directories and files
mkdir -p src/{controllers,models,routes}
mkdir -p config
touch config/{database.js,env.js}
mkdir -p public/{css,js,images}
mkdir -p tests/{unit,integration}

# Commit changes
git add -A && git commit -m "Add project structure"

# Pull latest changes
git pull --rebase origin main

# Push changes
git push origin main

echo "========================"
