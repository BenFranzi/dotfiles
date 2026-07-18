# Palette
COLOR_YELLOW='\033[1;33m'
COLOR_RED='\033[1;31m'
COLOR_RESET='\033[0m'

echo-yellow() {
  echo -e "${COLOR_YELLOW}$1${COLOR_RESET}"
}

echo-red() {
  echo -e "${COLOR_RED}$1${COLOR_RESET}"
}

# Aliases
alias git::setup="git init && git add -A &&& git commit -m\"initalise project\""
alias lg="lazygit"
alias y="nvm install && yarn install"
alias vim="nvim"
alias gs="git stash --include-untracked"


# Functions
showport() {
    if [[ -z $* ]]; then
      echo-yellow "Usage: what-port <port>"
      return 1
    fi

    lsof -ti:$1
}

killport() {
  if [[ -z $* ]]; then
    echo-yellow "Usage: kill-port <port>"
    return 1
  fi

  echo "Killing process using port $1"
  lsof -ti:$1 | xargs kill
}

react() {
  if [[ -z $1 ]]; then
    echo-yellow "Provide a project name - usage: react <project name>"
    return 1
  fi

  local project_name="$1"
  local repo_url="https://github.com/BenFranzi/launchpad-vite.git"

  git clone "$repo_url" "$project_name" || { echo-red "Failed to clone repository"; return 1; }
  cd "$project_name" || { echo-red "Failed to enter project directory"; return 1; }

  rm -rf .git
  git init
  git add -A
  git commit -m "Initialize project"

  yarn
}