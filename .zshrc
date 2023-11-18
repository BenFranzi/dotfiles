export ZSH="~/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Aliases
alias code="open -a Visual\ Studio\ Code "
alias yts="youtube-dl -x --audio-format mp3"
alias code="open -a Visual\ Studio\ Code"
alias y="yarn --frozen-lockfile"
alias y:s="y && yarn start"
alias y:d="y && yarn dev"
alias idea="open -a IntelliJ\ IDEA"
review() { git stash  --include-untracked && git fetch --all && git checkout $1 && git pull --rebase }
alias python="python3"
alias pip="pip3"
what-is-using-port() { lsof -i tcp:$1 }

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
