ZSH_TMUX_AUTOSTART=true

if [[ ":$FPATH:" != *":/Users/benfranzi/.zsh/completions:"* ]]; then export FPATH="/Users/benfranzi/.zsh/completions:$FPATH"; fi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions tmux)

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

. "/Users/benfranzi/.deno/env"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benfranzi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/benfranzi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/benfranzi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/benfranzi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
