os_installs() {
  export DEBIAN_FRONTEND=noninteractive

  info "Updating package lists..."
  sudo_if_available apt update

  info "Installing apt packages..."

  install_if_missing "curl" sudo_if_available apt install -y curl ca-certificates
  install_if_missing "git" sudo_if_available apt install -y git
  install_if_missing "zsh" sudo_if_available apt install -y zsh
  install_if_missing "fzf" sudo_if_available apt install -y fzf
  install_if_missing "zoxide" sudo_if_available apt install -y zoxide
  install_if_missing "rg" sudo_if_available apt install -y ripgrep
  install_if_missing "jq" sudo_if_available apt install -y jq
  install_if_missing "tree" sudo_if_available apt install -y tree
  install_if_missing "go" sudo_if_available apt install -y golang-go
  install_if_missing "python3" sudo_if_available apt install -y python3 python3-pip
  install_if_missing "htop" sudo_if_available apt install -y htop
  install_if_missing "wget" sudo_if_available apt install -y wget
  install_if_missing "tmux" sudo_if_available apt install -y tmux
  install_if_missing "zip" sudo_if_available apt install -y zip
  install_if_missing "unzip"   sudo_if_available apt install -y unzip
  install_if_missing "zip"     sudo_if_available apt install -y zip
  install_if_missing "stow"    sudo_if_available apt install -y stow
  install_if_missing "mosh" sudo_if_available apt install -y mosh

  export SHELL="$(which zsh)"
  info "Running generic installs..."

  if ! has_command bob; then
    info "Installing bob..."
    printf 'y\n' | bash -c "$(curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh)"
    export PATH="$PATH:$HOME/.local/bin"
  fi

  export PATH="$HOME/.local/bin:$PATH"
  if has_command bob && ! has_command nvim; then
    info "Installing latest neovim via bob..."
    printf 'y\n' | bob install latest
    bob use latest
    export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
  fi

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi

  current_shell=$(ps -p $$ -o comm=)
  if [ "$current_shell" != "zsh" ]; then
    info "Changing default shell to zsh..."
    if has_command usermod; then
      sudo_if_available usermod -s "$(which zsh)" "$(whoami)"
    elif has_command chsh; then
      if grep -qs "$(which zsh)" /etc/shells 2>/dev/null; then
        sudo_if_available chsh -s "$(which zsh)" "$(whoami)" || \
          info "Could not change shell (run: chsh -s $(which zsh))"
      else
        info "Adding $(which zsh) to /etc/shells..."
        sudo_if_available sh -c "echo $(which zsh) >> /etc/shells"
        sudo_if_available chsh -s "$(which zsh)" "$(whoami)" || \
          info "Could not change shell (run: sudo sh -c 'echo $(which zsh) >> /etc/shells' && chsh -s $(which zsh))"
      fi
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

  if ! has_command lazygit; then
    info "Installing lazygit..."
    LAZYGIT_ARCH=$(linux_arch)
    LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": *"v\K[^\"]*')
    curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
    tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
    sudo_if_available install /tmp/lazygit /usr/local/bin/lazygit
  fi

  if ! has_command lazydocker; then
    info "Installing lazydocker..."
    curl -fsSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
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

  if ! has_command yazi; then
    info "Installing yazi..."
    YAZI_ARCH=$(get_arch)
    curl -fsSL "https://github.com/sxyazi/yazi/releases/latest/download/yazi-${YAZI_ARCH}-unknown-linux-gnu.zip" -o /tmp/yazi.zip
    unzip -o /tmp/yazi.zip -d /tmp
    sudo_if_available install "/tmp/yazi-${YAZI_ARCH}-unknown-linux-gnu/yazi" /usr/local/bin/yazi
  fi

  install_if_missing "deno" bash -c 'curl -fsSL https://deno.land/install.sh | sh'

  if ! has_command opencode; then
    info "Installing opencode..."
    curl -fsSL https://opencode.ai/install | bash
  fi
}
