#!/usr/bin/env bash

if [ -z "$ZSH_VERSION" ] && command -v zsh >/dev/null 2>&1; then
  exec zsh "$0" "$@"
fi

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

os_installs

export PATH="$HOME/.local/bin:$HOME/.deno/bin:$HOME/go/bin:$HOME/.opencode/bin:$HOME/.cargo/bin:$HOME/.local/share/bob/nvim-bin:$PATH"

verify_os_installs

success "Install was a success! ✅"

print_banner

# echo "next step, run `stow -v -d . -t ~ dotfiles`"
# echo "to undo it run `stow -v -D -d . -t ~ dotfiles`"