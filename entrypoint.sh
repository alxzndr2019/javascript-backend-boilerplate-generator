#!/bin/bash

echo "========================"

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

node /usr/bin/index.js

git add -A && commit -m "Generate boilerplate"

git push --set-upstream origin main


echo "========================"
