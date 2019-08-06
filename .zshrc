# Path to your oh-my-zsh installation.
export ZSH="/Users/benfranzi/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Aliases
function cdandls() { cd "$1" && ls; }
alias c="cdandls"
alias o="open "
alias p="cd ~/Documents/Projects/"
alias l="ls -lah"
alias vsc="open -a Visual\ Studio\ Code "
alias stree="open -a Sourcetree"
alias te='open -a TextEdit'
alias yts="youtube-dl -x --audio-format mp3"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
