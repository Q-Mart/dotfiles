#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export LC_ALL="en_GB.UTF-8"

# Editor
export VISUAL="nvim"
export EDITOR="nvim"

# GO
export GOPATH=$HOME/prog/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Ruby
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Aliases
alias tmux='tmux -2'

alias weather='curl wttr.in/york'

alias uni='cd ~/prog/shared/4thYear'
alias prif='cd ~/prog/shared/Project'

alias update='yay -Syu --devel --timeupdate'

alias h='~/.config/i3/termfromhere.sh&'
