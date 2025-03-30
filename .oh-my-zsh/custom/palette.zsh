COLOR_YELLOW='\033[1;33m'
COLOR_RED='\033[1;31m'
COLOR_RESET='\033[0m'

echo-yellow() {
  echo -e "${COLOR_YELLOW}$1${COLOR_RESET}"
}

echo-red() {
  echo -e "${COLOR_RED}$1${COLOR_RESET}"
}