#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/bin/common.sh"

print_banner

OS=$(get_os)
info "Detected OS: $OS"

os_setup="$SCRIPT_DIR/bin/${OS}.sh"
if file_exists "$os_setup"; then
  source "$os_setup"
else
  error "No setup script for $OS at $os_setup"
  exit 1
fi

export SHELL="$(which zsh)"
os_installs

export PATH="$HOME/.local/bin:$HOME/.deno/bin:$HOME/go/bin:$HOME/.opencode/bin:$HOME/.cargo/bin:$PATH"

verify_os_installs

info "Resolving stow conflicts..."
stow_dir="$SCRIPT_DIR/dotfiles"
backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d%H%M%S)"

while IFS= read -r -d '' entry; do
  rel="${entry#$stow_dir/}"
  target="$HOME/$rel"

  if [ -f "$target" ] && [ ! -L "$target" ]; then
    mkdir -p "$(dirname "$backup_dir/$rel")"
    mv "$target" "$backup_dir/$rel"
    info "Backed up $rel → $backup_dir/$rel"
  fi
done < <(find "$stow_dir" -type f -print0)

info "Stowing dotfiles to $HOME..."
stow -d "$SCRIPT_DIR" -t "$HOME" dotfiles

success "Install was a success! ✅"

print_banner