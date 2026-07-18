#!/usr/bin/env bash
get_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macos"
  elif [[ -f /etc/debian_version ]]; then
    echo "debian"
  else
    echo "unknown"
  fi
}

print_banner() {
  cat <<'EOF'


 ____  ____  ____    __    _  _  ____  ____     
(  _ \( ___)(  _ \  /__\  ( \( )(_   )(_  _)    
 ) _ < )__)  )   / /(__)\  )  (  / /_  _)(_     
(____/(__)  (_)\_)(__)(__)(_)\_)(____)(____)    
 ____  _____  ____  ____  ____  __    ____  ___ 
(  _ \(  _  )(_  _)( ___)(_  _)(  )  ( ___)/ __)
 )(_) ))(_)(   )(   )__)  _)(_  )(__  )__) \__ \
(____/(_____) (__) (__)  (____)(____)(____)(___/



EOF
}

get_arch() {
  local arch
  arch=$(uname -m)
  case "$arch" in
    x86_64|amd64) echo "x86_64" ;;
    aarch64|arm64) echo "aarch64" ;;
    *) echo "$arch" ;;
  esac
}

linux_arch() {
  local arch
  arch=$(get_arch)
  case "$arch" in
    x86_64) echo "x86_64" ;;
    aarch64) echo "arm64" ;;
    *) echo "$arch" ;;
  esac
}

has_command() {
  command -v "$1" >/dev/null 2>&1
}

require_command() {
  if ! has_command "$1"; then
    echo "Missing required command: $1, exiting..."
    exit 1
  fi
}

sudo_if_available() {
  if has_command sudo; then
    sudo "$@"
  else
    "$@"
  fi
}

verify_os_installs() {
  local errors=0

  info "Verifying installed tools..."

  for cmd in curl git zsh fzf zoxide rg jq go python3 htop wget tmux unzip zip stow tree rustc; do
    if ! has_command "$cmd"; then
      error "$cmd not found"
      errors=$((errors + 1))
    fi
  done

  for cmd in deno bob nvim lazygit lazydocker lazysql yazi opencode; do
    if ! has_command "$cmd"; then
      error "$cmd not found (may need PATH update or manual install)"
      errors=$((errors + 1))
    fi
  done

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    error "oh-my-zsh not found at $HOME/.oh-my-zsh"
    errors=$((errors + 1))
  fi

  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    error "TPM not found at $HOME/.tmux/plugins/tpm"
    errors=$((errors + 1))
  fi

  if [ ! -d "$HOME/.nvm" ]; then
    error "nvm not found at $HOME/.nvm"
    errors=$((errors + 1))
  fi

  if [ ! -d "$HOME/.pyenv" ]; then
    error "pyenv not found at $HOME/.pyenv"
    errors=$((errors + 1))
  fi

  if [ ! -d "$HOME/.sdkman" ]; then
    error "sdkman not found at $HOME/.sdkman"
    errors=$((errors + 1))
  fi

  if [ "$errors" -eq 0 ]; then
    success "All tools verified"
  else
    error "$errors tool(s) missing — check output above"
    exit 1
  fi
}

# Unconfirmed useful

file_exists() {
  [[ -f "$1" ]]
}

directory_exists() {
  [[ -d "$1" ]]
}

install_if_missing() {
  local command=$1
  shift

  if ! has_command "$command"; then
    echo "Installing $command..."
    "$@"
  else
    echo "$command already installed"
  fi
}

confirm() {
  read -r -p "$1 [y/N] " response

  [[ "$response" =~ ^[Yy]$ ]]
}

info() {
  echo "[INFO] $*"
}

success() {
  echo "[OK] $*"
}

error() {
  echo "[ERROR] $*" >&2
}
