#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b $XDG_CONFIG_HOME/.dircolors)"
alias ls='ls $LS_OPTIONS'
alias diff='diff $LS_OPTIONS'
alias ip='ip $LS_OPTIONS'
alias grep='grep $LS_OPTIONS'

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

PS1='[\[\e[1;37m\]\u\e[1;31m\]@\e[1;37m\]\h]\e[1;31m\]$(git_branch) \e[1;37m\]→ \[\e[36m\]\w\[\e[0m\] '
#PS1='[\[\u\e[1;31m\]@\e[1;37m\]\h]\e[1;31m\]$(git_branch) \e[1;37m\]→ \[\e[36m\]\w\[\e[0m\] '
#source /home/anton/.config/asbash/asbash.bashrc
#PS1='[\u@\h \W]\$ '
xset r rate 300 50
source ~/.config/asbash/asbashrc
eval "$(tmuxifier init -)"
alias config='/usr/bin/git --git-dir=/home/anton/dotfiles/ --work-tree=/home/anton'
