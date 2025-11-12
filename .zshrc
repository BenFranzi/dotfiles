ZSH_TMUX_AUTOSTART=true

if [[ ":$FPATH:" != *":/Users/benfranzi/.zsh/completions:"* ]]; then export FPATH="/Users/benfranzi/.zsh/completions:$FPATH"; fi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    tmux
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
