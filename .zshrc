export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

if [ -f ~/.local.zshrc ]; then
    source ~/.local.zshrc
fi
source $ZSH/oh-my-zsh.sh

# aliases
alias y="yarn --frozen-lockfile"
alias y:s="y && yarn start"
alias y:d="y && yarn dev"

alias python="python3"
alias pip="pip3"
alias vim="nvim"

alias code="open -a Visual\ Studio\ Code"
alias idea="open -a IntelliJ\ IDEA"

what-is-using-port() {
    lsof -i tcp:$1
}
review() {
    git stash  --include-untracked
    git fetch --all
    git checkout $1
    git pull --rebase
}