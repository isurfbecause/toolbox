# Delete GitHub repos

> A bash script that allows users to interactively select and delete multiple GitHub repositories.

---

## Overview

This script allows you to delete multiple GitHub repositories at once. Using `fzf`, it provides an interactive interface where you can select repositories to delete, confirm your selection, and proceed with deletion.

## Motivatation

I created this script to help me remove GitHub repos I haven't used in a long time.

## Screenshots

## Features

- Interactive selection of repositories with `fzf`
- Multi-selection support for bulk deletion
- Confirmation prompt to prevent accidental deletions
- Deletes repositories from your GitHub account using the GitHub API

## Requirements

- **Bash**: The script requires a Unix-based shell.
- **Dependencies**:
  - **[fzf](https://github.com/junegunn/fzf)**: For interactive selection.
  - **[jq](https://github.com/jqlang/jq)**: For processing JSON data.
  - **curl**: For making API requests.

## Usage

### Set Up Your GitHub Token

- This script requires a GitHub token.
- [Create Github personal access token (classic)](https://github.com/settings/tokens)
- Generate new token (classic)
- Set "Expiration" to "Custom" 1 day. You should not be using this token over 1 day. This is a dangerous token.
- Select scopes
  - `delete_repo`

### Create .env file

- Create a `.env` file in the same directory as the script.
- Add your Github token and username to `.env`

```plaintext
USERNAME=<your-github-username>
GITHUB_ACCESS_TOKEN=<your-personal-access-token>
```

### Make script executable

```sh
chmod +x delete_repos.sh
```

### Execute script

```sh
./delete_repos.sh
```
