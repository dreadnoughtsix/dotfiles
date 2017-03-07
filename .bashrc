# ~/.bashrc
#
export PATH="$HOME/bin:$HOME/.gem/ruby/2.4.0/bin:$PATH"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias pacman='sudo pacman'
alias mount='sudo mount'
alias umount='sudo umount'
alias ls='ls --color=auto -laiF'
PS1='[\u@\h \W]\$ '
