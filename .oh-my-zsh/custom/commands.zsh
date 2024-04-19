# what-is-using-port <port> - get the PID that is hogging a port
what-is-using-port() {
    lsof -i tcp:$1
}

# review <branch> - Stash your changes and pull someone else's branch
review() {
    git stash  --include-untracked
    git fetch --all
    git checkout $1
    git pull --rebase
}

# ts <project name> - Clone and setup a basic typescript project
ts() {
    if [[ -z $1 ]]; then
        echo "Provide a project name - usage: ts <project name>"
        return 1
    fi

    git clone https://gist.github.com/BenFranzi/798dc4a4f920c24fbc84b8287a17734c
    mv 798dc4a4f920c24fbc84b8287a17734c $1
    cd $1
    npm install
}