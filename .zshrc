# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Aliases
function cdandls() { cd "$1" && ls; }
alias c="cdandls"
alias o="open "
alias p="cd ~/Documents/Projects/"
alias l="ls -lah"
alias code="open -a Visual\ Studio\ Code "
alias te='open -a TextEdit'
alias yts="youtube-dl -x --audio-format mp3"
alias code="open -a Visual\ Studio\ Code"
Alias code:2="open -a Visual\ Studio\ Code\ -\ Insiders"
alias y="yarn --frozen-lockfile"
alias y:s="y && yarn start"
alias y:d="y && yarn dev"
alias te="open -a TextEdit"
alias idea="open -a IntelliJ\ IDEA"
alias p="cd ~/Documents/Projects"
alias d="cd ~/Documents"
review() { git stash  --include-untracked && git fetch --all && git checkout $1 && git pull --rebase }
review:s() { git stash  --include-untracked && git fetch --all && git checkout $1 && git pull --rebase && y:s }
alias python="python3"
alias pip="pip3"
what-is-using-port() { lsof -i tcp:$1 }
alias hack="docker run -rm -it --name hollywood jturpin/hollywood hollywood"
alias hack:stop="docker kill hollywood"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
