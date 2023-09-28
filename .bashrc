#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check if nvim is available
if command -v nvim &>/dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

export PATH="$HOME/.tmuxifier/bin:$PATH"

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

color_formatter() {
  if [[ $# -eq 1 ]]; then
    echo "\e[$1m\]"
  else
    echo "\e[$1;$2m\]"
  fi
}

# Use 256 color terminal if it exists
if [ -e /lib/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

PS1='[\[\e[1;37m\]\u\e[1;31m\]@\e[1;37m\]\h]\e[1;31m\]$(git_branch) \e[1;37m\]→ \[\e[36m\]\w\[\e[0m\] '

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
#
xset r rate 300 50

eval "$(tmuxifier init -)"
eval "$(dircolors $HOME/.ls_colors)"
source $XDG_CONFIG_HOME/asbash/asbashrc
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
