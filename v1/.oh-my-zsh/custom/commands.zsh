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

# review <branch> - Stash your local changes and pull another branch
review() {
  if [[ -z $* ]]; then
    echo-yellow "Usage: review <branch>\ndoes\n  - stashes working files\n  - checkout branch\n  - fetches branch\n  - pull rebases branch"
    return 1
  fi

  git stash  --include-untracked
  git checkout $1
  git fetch origin $1 --prune --prune-tags
  git rebase origin/$1
  git status
  git rev-parse HEAD
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
    echo-yello "Provide a project name - usage: react-ts <project name>"
    return 1
  fi

  local project_name="$1"
  local repo_url="https://github.com/BenFranzi/launchpad-vite.git"

  # Clone the repository
  git clone "$repo_url" "$project_name" || { echo-red "Failed to clone repository"; return 1; }

  # Move into project directory
  cd "$project_name" || { echo-red "Failed to enter project directory"; return 1; }

  # Reset Git history
  rm -rf .git
  git init
  git add -A
  git commit -m "Initialize project"

  # Install dependencies
  yarn
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
