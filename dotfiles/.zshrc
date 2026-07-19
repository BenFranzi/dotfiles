export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.local/bin:$HOME/.deno/bin:$HOME/go/bin:$HOME/.opencode/bin:$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"

ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# Source  ~/.local.zshrc if it exists
if [ -f ~/.local.zshrc ]; then
    source ~/.local.zshrc
fi

source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"
[ -s "$PYENV_ROOT/bin/pyenv" ] && eval "$(pyenv init -)"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

eval "$(fzf --zsh)"
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

export EDITOR="nvim"
export VISUAL="nvim"

git config --global alias.lg "log --oneline --graph --decorate --all"

eval "$(zoxide init zsh)"

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

if [ -z "$TMUX" ]; then
  tmux new-session -A -s main
fi