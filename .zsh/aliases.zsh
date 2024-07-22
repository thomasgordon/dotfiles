# MISC ALIASES
alias t="tmux"
alias brewcleanup='brew update && brew upgrade && brew cleanup'
alias nv='nvim'
alias c='clear'

# BETTER LS COMMANDS
alias ls="eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons"
alias ll='eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons -lh'
alias la='eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons -a'
alias lla='eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons -lah'
alias lsa='eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons -lah'

# GIT BRANCH FUNCTIONS (SEE FUNCTIONS.ZSH)
alias nb='create_branch'
alias mb='merge_branch'

# MOVING UP DIRECTORIES
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'

# .ZSH ALIASES
alias sc='source ~/.dotfiles/.zshrc'
alias zshrc='nvim ~/.dotfiles/.zshrc'
alias aliases='nvim ~/.dotfiles/.zsh/aliases.zsh'

# FILE SHORTCUTS
alias tatyou='cd ~/Documents/TATYOU/tatyou'
alias docs='cd ~/Documents/'
alias prog='cd ~/Documents/Programming/'
