# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=999999
export HISTSIZE=$HISTFILESIZE
export HISTIGNORE="ls"
export HISTTIMEFORMAT="[%Y-%m-%d - %H:%M:%S] "
shopt -s histappend
export EDITOR=vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="verbose"
source /etc/bash_completion.d/git-completion.bash
source /etc/bash_completion.d/git-prompt.sh
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="\[\e]2;\w@\H: \w\a\e[35;1m\]\W\[\e[32;1m\]-\[\e[35;1m\]$\[\e[0m\] "
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\[\e[35;1m\][Coding \[\e[30;1m\]is \[\e[35;1m\]Boring] \[\e[36;1m\]-> \[\e[32;1m\]\H \[\e[36;1m\]| \[\e[33;1m\]\w \[\e[36;1m\]& $(__git_ps1 "(%s) ")\[\e[30;1m\]\t\n\[\e[31;1m\]> \[\e[0m\]'
#     PS1='$(__git_ps1 " (%s)")'
#    PS1="\[\e[35;1m\][Coding \[\e[30;1m\]is \[\e[35;1m\]Boring] \[\e[36;1m\]-> \[\e[32;1m\]\h \[\e[36;1m\]| \[\e[33;1m\]\w\n\[\e[31;1m\]> \[\e[0m\]"
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
#if [ "$TERM" != "dumb" ]; then
#    eval "`dircolors -b`"
#    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
#fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vi='/home/langs/bin/vim/bin/vim'
alias vim='/home/langs/bin/vim/bin/vim'
alias grep='grep --color -n'
#alias xpra='PYTHONPATH=`ls -d install/lib*/python2.7/site-packages`:$PYTHONPATH /home/langs/tmp/xpra/install/bin/xpra'

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -d /opt/local/bin ] ; then
    PATH=/opt/local/bin:"${PATH}"
fi
if [ -d /opt/local/libexec/gnubin ] ; then
  PATH=/opt/local/libexec/gnubin:"${PATH}"
fi
if [ -d ~/bin ] ; then
    PATH="${PATH}":~/bin:~/bin/musl/bin
fi
if [ -d ~/script ] ; then
    PATH="${PATH}":~/script
fi

export PATH=$HOME/bin/openmpi/bin:$PATH:/opt/VirtualGL/bin:$HOME/bin/go/bin:$HOME/sc/libs/cling/bin
export LD_LIBRARY_PATH=$HOME/bin/openmpi/bin:$LD_LIBRARY_PATH
export GOROOT=$HOME/bin/go
export GOPATH=$HOME/gocode

man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
      LESS_TERMCAP_md=$'\E[01;31m' \
      LESS_TERMCAP_me=$'\E[0m' \
      LESS_TERMCAP_se=$'\E[0m' \
      LESS_TERMCAP_so=$'\E[01;44;33m' \
      LESS_TERMCAP_ue=$'\E[0m' \
      LESS_TERMCAP_us=$'\E[01;32m' \
  man "$@"
}

#PATH=$PATH:$HOME/tmp/xpra/install/bin
#export PATH
#export PYTHONPATH=/home/langs/tmp/xpra/install/lib64/python2.7/site-packages:$PYTHONPATH

#export CLICOLOR=1
setxkbmap -option 'ctrl:swapcaps'

# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -s cdspell
