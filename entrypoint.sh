#!/bin/bash

echo "========================"

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Run your script to generate the project structure
node /app/index.js

# Commit and push changes
git add -A && git commit -m "Generate boilerplate" && git push --set-upstream origin main

echo "========================"
