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

# X11 forwarding
export DISPLAY=localhost:0.0

#Aliases
alias tmux='tmux -2'
alias vim='nvim'
alias vi='nvim'

alias svn='svn.exe'

#Set editor to nvim
export EDITOR='nvim'
export VISUAL='nvim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/q/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/q/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/q/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/q/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# MoM commands
function mom-ssh() {
  BASTION_IP=$1
  VM_IP=$2
  
  ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PreferredAuthentications=publickey -o ProxyCommand="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PreferredAuthentications=publickey -W %h:%p -i ~/.ssh/mom.pem centos@$BASTION_IP" -i ~/.ssh/mom.pem centos@$VM_IP
}

function mom-ssh-cmd() {
  BASTION_IP=$1
  VM_IP=$2
  CMD=$3
  
  ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PreferredAuthentications=publickey -o ProxyCommand="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PreferredAuthentications=publickey -W %h:%p -i ~/.ssh/mom.pem centos@$BASTION_IP" -i ~/.ssh/mom.pem centos@$VM_IP $3
}

function mom-tunnel() {
  BASTION_IP=$1
  PORT_BIND=$2

  ssh -N -D $PORT_BIND -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PreferredAuthentications=publickey -i ~/.ssh/mom.pem centos@$BASTION_IP
}
