export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# ~/.local.zshrc - local zshrc for all installation referencing
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
