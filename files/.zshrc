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
export PATH=$PATH:$HOME.linuxbrew/opt/go/libexec/bin
export GOPATH=$HOME/prog/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

#LinuxBrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

#Arduino
export ARDUINO_DIR="/usr/share/arduino"
export ARDMK_DIR="/usr/shar/arduino"
export AVR_TOOLS_DIR="/usr"

#Aliases
alias mygosrc='$GOPATH/src/github.com/Q-Mart'
alias urygosrc='$GOPATH/src/github.com/UniversityRadioYork'

alias v='$vim -u'
