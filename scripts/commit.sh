#!/bin/bash
# Interactive script to create conventional commits

# Make sure the scripts directory exists
mkdir -p "$(dirname "$0")"

# Define available types
types=("feat" "fix" "docs" "style" "refactor" "perf" "test" "build" "ci" "chore" "revert")

# Show available types
echo "Available commit types:"
for i in "${!types[@]}"; do
  echo "  $((i+1)). ${types[$i]}"
done

# Get commit type
read -p "Select commit type (1-${#types[@]}): " type_num
if [[ ! "$type_num" =~ ^[0-9]+$ ]] || [ "$type_num" -lt 1 ] || [ "$type_num" -gt "${#types[@]}" ]; then
  echo "Invalid selection. Exiting."
  exit 1
fi
type=${types[$((type_num-1))]}

# Get scope (optional)
read -p "Enter scope (optional, press Enter to skip): " scope
scope_text=""
if [ -n "$scope" ]; then
  scope_text="($scope)"
fi

# Get description
read -p "Enter commit description: " description

# Get body (optional)
echo "Enter commit body (optional, press Enter twice to finish):"
body=""
while IFS= read -r line; do
  [ -z "$line" ] && break
  body="${body}${line}
"
done

# Get footer (optional)
read -p "Enter footer (optional, press Enter to skip): " footer

# Build commit message
commit_msg="${type}${scope_text}: ${description}"
if [ -n "$body" ]; then
  commit_msg="${commit_msg}

${body}"
fi
if [ -n "$footer" ]; then
  commit_msg="${commit_msg}

${footer}"
fi

# Show the final message
echo -e "\nCommit message:"
echo "--------------------------------------"
echo "$commit_msg"
echo "--------------------------------------"

# Confirm and commit
read -p "Commit with this message? (y/n): " confirm
if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
  git commit -m "$commit_msg"
  echo "Committed successfully!"
else
  echo "Commit canceled."
fi
