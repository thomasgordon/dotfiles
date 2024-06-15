alias t="tmux"
alias tatyou="cd ~/Documents/__tatyou__/tatyou"
alias zshreload='source ~/.zshrc'
alias zshedit='open -a TextEdit ~/.zshrc'
alias brewcleanup='brew update && brew upgrade && brew cleanup'
alias c='clear'

alias ls="eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons"
alias ll='eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons -lh'
alias la='eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons -a'
alias lla='eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons -lah'
alias lsa='eza --color=always --group-directories-first --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --icons -lah'

alias nb='create_branch'
alias mb='merge_branch'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'

alias sc='source ~/.dotfiles/.zshrc'
alias zshrc='nvim ~/.dotfiles/.zshrc'
alias sship='nvim ~/.dotfiles/.config/starship.toml'
alias aliases='nvim ~/.dotfiles/.zsh/aliases.zsh'