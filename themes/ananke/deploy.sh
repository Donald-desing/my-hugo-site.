#!/bin/sh

# If a command fails, the script exits
set -e

# Build the project
hugo

# Navigate to the public directory
cd public

# Add changes to git
git add .

# Commit changes
msg="Rebuilding site $(date)"
if [ -n "$*" ]; then
  msg="$*"
fi
git commit -m "$msg"

# Push to the repository
git push origin gh-pages
