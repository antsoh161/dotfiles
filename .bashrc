#
# ~/.bashrc
#

# #If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Auto winsize
shopt -s checkwinsize


# Check if nvim is available
if command -v nvim &>/dev/null; then
   export EDITOR=nvim
else
   export EDITOR=vim
fi

if [ -z "$XDG_CONFIG_HOME" ]; then
   export XDG_CONFIG_HOME="$HOME/.config"
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
   if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      # We have color support; assume it's compliant with Ecma-48
      # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
      # a case would tend to support setf rather than setaf.)
      color_prompt=yes
   else
      color_prompt=
   fi
fi

if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

#If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt* | alacritty | kitty | st*)
   PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
   ;;
*) ;;
esac

git_branch() {
   git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'
   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'

   alias ls='ls --color=auto'
   alias diff='diff --color=auto'
   alias ip='ip --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# catppucin-mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
#
[ -f ~/.fzf/shell/fzf.bash ] && source ~/.fzf/shell/fzf.bash

# Somehow this resets every time i change keyboard between PCs
xset r rate 300 50

source $XDG_CONFIG_HOME/asbash/asbashrc
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export DOCKER_CONTAINER_REGISTRY_TOKEN=$(cat ~/.gh_docker_secret.txt)
