#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ -f .env ]; then
  # shellcheck source=/dev/null
  . .env
else
  echo ".env not found"
  exit 1
fi

if ! command -v fzf &>/dev/null; then
  echo "fzf is required"
  exit 1
fi

BASE_URL=https://api.github.com

REPOS=$(curl -s -u "$USERNAME:$GITHUB_ACCESS_TOKEN" "${BASE_URL}/users/$USERNAME/repos" | jq -r '.[].full_name' | fzf --multi --preview "echo {}")

if [ -z "${REPOS}" ]; then
  echo "No repos"
  exit 0
fi

# Confirm deletion
echo "The following repositories will be deleted:"
echo "$REPOS"
read -p "Are you sure you want to delete these repositories? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted."
  exit 0
fi

# Loop through selected repositories and delete them
for REPO in $REPOS; do
  echo "Deleting repository: $REPO"
  curl -X DELETE -s -u "$USERNAME:$GITHUB_ACCESS_TOKEN" "${BASE_URL}/repos/$REPO"
done
