# Antidote
if [[ "$OSTYPE" == "darwin"* ]]; then
    source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
else
    source ~/.antidote/antidote.zsh
    export PATH="$PATH:$HOME/.local/bin"
    export TERM=xterm-256color
fi

antidote load ~/.config/antidote/.zsh_plugins.txt

source ~/.config/zsh/aliases.zsh

# For command history searching
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.yaml)"
