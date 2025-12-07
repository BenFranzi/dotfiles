if [[ ":$FPATH:" != *":/Users/benfranzi/.zsh/completions:"* ]]; then export FPATH="/Users/benfranzi/.zsh/completions:$FPATH"; fi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Source  ~/.local.zshrc if it exists
if [ -f ~/.local.zshrc ]; then
    source ~/.local.zshrc
fi

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

eval "$(zoxide init zsh)"

. "/Users/benfranzi/.deno/env"


# Auto-attach to (or create) session "main"
if command -v tmux >/dev/null 2>&1; then
  if [[ -o interactive ]] && [[ -z "$TMUX" ]]; then
    tmux new-session -t main -c "$PWD" || tmux attach-session -t main -c "$PWD"
  fi
fi
