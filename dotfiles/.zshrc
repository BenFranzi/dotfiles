export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

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