#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/benfranzi/dotfiles.git"
DEST="${DOTFILES_DIR:-$HOME/dotfiles}"

if [ ! -d "$DEST" ]; then
    echo "Cloning dotfiles to $DEST..."
    git clone "$REPO_URL" "$DEST"
fi

exec "$DEST/install.sh"
