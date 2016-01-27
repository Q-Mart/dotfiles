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

#GO
export PATH=$PATH:/home/qumarth/.linuxbrew/opt/go/libexec/bin
export GOPATH=$HOME/prog/go
export PATH=$PATH:$GOPATH/bin

#LinuxBrew
export PATH="$HOME/.linuxbrew/bin:P$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

#Aliases
alias mygosrc='$GOPATH/src/github.com/Q-Mart'
alias urygosrc='$GOPATH/src/github.com/UniversityRadioYork'
