#!/bin/bash
# Script to remove all GitHub releases except v0.0.1

echo "Removing all GitHub releases except v0.0.1..."

# Get all release tags
RELEASES=$(gh release list --limit 1000 | awk '{print $2}')

# Loop through each release and delete it
for release in $RELEASES; do
  if [ "$release" != "v0.0.1" ]; then
    echo "Deleting release: $release"
    gh release delete "$release" --yes
  fi
done

echo "Checking remaining releases..."
gh release list

echo "Done!"
