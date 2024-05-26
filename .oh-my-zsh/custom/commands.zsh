# show-port <port> - get the PID that is hogging a port
show-port() {
    if [[ -z $* ]]; then
      echo-yellow "Usage: what-port <port>"
      return 1
    fi

    lsof -ti:$1
}

# kill-port <port> - kill what is hogging a port
kill-port() {
  if [[ -z $* ]]; then
    echo-yellow "Usage: kill-port <port>"
    return 1
  fi

  echo "Killing process using port $1"
  lsof -ti:$1 | xargs kill
}

# review <branch> - Stash your changes and pull someone else's branch
review() {
  if [[ -z $* ]]; then
    echo-yellow "Usage: review <branch>\ndoes\n  - stashes working files\n  - fetches all\n  - checkout branch\n  - pull rebase"
    return 1
  fi

  git stash  --include-untracked
  git fetch --all
  git checkout $1
  git pull --rebase
}



#### Work in Progress
# ts <project name> - Clone and setup a basic typescript project
ts() {
  if [[ -z $1 ]]; then
    echo "Provide a project name - usage: ts <project name>"
    return 1
  fi

  git clone https://gist.github.com/BenFranzi/798dc4a4f920c24fbc84b8287a17734c
  mv 798dc4a4f920c24fbc84b8287a17734c $1
  cd $1
  rm -rf .git
  npm install
  git init
  git add -A
  git commit -m"initalise project"
}

# ts-plus <project name> - Clone and setup a basic typescript project
ts-plus() {
  if [[ -z $1 ]]; then
    echo "Provide a project name - usage: ts <project name>"
    return 1
  fi

  git clone https://github.com/BenFranzi/launchpad-typescript
  mv launchpad-typescript $1
  cd $1
  rm -rf .git
  npm install
  git init
  git add -A
  git commit -m"initalise project"
}

# react-ts <project name> - Clone and setup a basic react ts project
react-ts() {
  if [[ -z $1 ]]; then
    echo "Provide a project name - usage: react-ts <project name>"
    return 1
  fi

  git clone git@github.com:BenFranzi/launchpad-vite.git
  mv launchpad-vite $1
  cd $1
  rm -rf .git
  npm install
  git init
  git add -A
  git commit -m"initalise project"
}
# react-js <project name> - Clone and setup a basic react js project
react-js() {
  if [[ -z $1 ]]; then
    echo "Provide a project name - usage: react-js <project name>"
    return 1
  fi

  git clone git@github.com:BenFranzi/react-js.git
  mv react-js $1
  cd $1
  rm -rf .git
  git init
  git add -A
  git commit -m\"initalise project\"
  npm install
}

crud-js() {
  if [[ -z $1 ]]; then
    echo "Provide a project name - usage: crud-js <project name>"
    return 1
  fi

  git clone https://gist.github.com/BenFranzi/98d770579df156ab3a9257ae8bda649b
  mv 98d770579df156ab3a9257ae8bda649b $1
  cd $1
  rm -rf .git
  git init
  git add -A
  git commit -m\"initalise project\"
  npm install
}

# patcher init (sets up patch directory)

# patcher
## patcher -c name (creates patch with name)
## patcher name (applies patch)
## patcher -R name (removes patch) (or does nothing if not existing)


# bob <template-name> <...arguments> - creates a template
# Function to copy template file to project directory and substitute variables
#bob() {
#  local projectName="$1"
#  local camelCase=$(echo $projectName | sed -E 's/[^a-z]+([a-z])/\U\1/gi;s/^([A-Z])/\1/')
#  echo $camelCase
#}