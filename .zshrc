# Instant Prompt Initialization
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf-tab)
source $ZSH/oh-my-zsh.sh

# Editor Configuration
export EDITOR='nano'

# Aliases
################################
alias t="tmux"
alias tatyou="cd ~/Documents/__tatyou__"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias zshreload='source ~/.zshrc'
alias zshedit='open -a TextEdit ~/.zshrc'
alias brewcleanup='brew update && brew upgrade && brew cleanup'
alias c='clear'

# Custom Commands
################################

# Function to create a new tmux session
nt() {
  tmux new -s "$1"
}

# Git Branching Commands
create_branch() {
  if [ -z "$1" ]; then
    echo "Usage: nf <branch-type> <branch-name>"
    return 1
  fi

  branch_type=$1
  branch_name=$2

  case $branch_type in
    feature) git checkout -b "feature/$branch_name" ;;
    bugfix)  git checkout -b "bugfix/$branch_name" ;;
    release) git checkout -b "release/$branch_name" ;;
    hotfix)  git checkout -b "hotfix/$branch_name" ;;
    *) echo "Invalid branch type. Use feature, bugfix, release, or hotfix."
       return 1 ;;
  esac
}

merge_branch() {
  if [ -z "$1" ]; then
    echo "Usage: mb <source-branch> <target-branch>"
    return 1
  fi

  source_branch=$1
  target_branch=$2

  git checkout $target_branch
  git pull origin $target_branch
  git merge $source_branch
  git push origin $target_branch
}

# Aliases for Git Branching Commands
alias nb='create_branch'
alias mb='merge_branch'

# Path Configuration
export PATH="$PATH":"$HOME/.pub-cache/bin"

# History Setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Key Bindings for History Search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Source Plugins
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Eza (Better ls) Configuration
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Fzf Configuration
eval "$(fzf --zsh)"

# Additional Commands
neofetch

# Powerlevel10k Configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

