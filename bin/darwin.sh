os_installs() {
  info "Ensuring Xcode CLI tools..."
  xcode-select --install 2>/dev/null || true

  if ! has_command brew; then
    info "Installing Homebrew..."
    NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if [[ "$(uname -m)" == "arm64" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
  fi

  info "Installing brew packages..."

  install_if_missing "fzf"      brew install fzf
  install_if_missing "zoxide"   brew install zoxide
  install_if_missing "rg"       brew install ripgrep
  install_if_missing "jq"       brew install jq
  install_if_missing "tree"     brew install tree
  install_if_missing "go"       brew install go
  install_if_missing "python3"  brew install python
  install_if_missing "htop"     brew install htop
  install_if_missing "wget"     brew install wget
  install_if_missing "tmux"     brew install tmux
  install_if_missing "unzip"    brew install unzip
  install_if_missing "zip"      brew install zip
  install_if_missing "stow"        brew install stow
  install_if_missing "mosh"        brew install mosh
  install_if_missing "lazygit"     brew install lazygit
  install_if_missing "lazydocker"  brew install lazydocker
  install_if_missing "yazi"        brew install yazi

  export SHELL="$(which zsh)"
  info "Running generic installs..."

  if ! has_command bob; then
    info "Installing bob..."
    printf 'y\n' | bash -c "$(curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh)"
  fi

  export PATH="$HOME/.local/bin:$PATH"
  if has_command bob && ! has_command nvim; then
    info "Installing latest neovim via bob..."
    printf 'y\n' | bob install latest
    bob use latest
  fi

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi

  current_shell=$(ps -p $$ -o comm=)
  if [ "$current_shell" != "zsh" ]; then
    info "Changing default shell to zsh... (you may need to enter your password)"

    if grep -qs "$(which zsh)" /etc/shells 2>/dev/null; then
      chsh -s "$(which zsh)" || info "Could not change shell (run manually: chsh -s $(which zsh))"
    else
      info "Adding $(which zsh) to /etc/shells..."
      sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s "$(which zsh)" || \
        info "Could not change shell (run: sudo sh -c 'echo $(which zsh) >> /etc/shells' && chsh -s $(which zsh))"
    fi
  fi

  ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  fi
  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  fi

  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  fi

  if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  fi

  if [ ! -d "$HOME/.pyenv" ]; then
    curl https://pyenv.run | bash
  fi

  if [ ! -d "$HOME/.sdkman" ]; then
    curl -s "https://get.sdkman.io" | bash
  fi

  if ! has_command lazysql; then
    info "Installing lazysql..."
    go install github.com/jorgerojas26/lazysql@latest
  fi

  if ! has_command rustc; then
    info "Installing Rust via rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  fi

  export PATH="$HOME/.cargo/bin:$PATH"

  install_if_missing "deno" bash -c 'curl -fsSL https://deno.land/install.sh | sh'

  if ! has_command opencode; then
    info "Installing opencode..."
    curl -fsSL https://opencode.ai/install.sh | bash
  fi
}
