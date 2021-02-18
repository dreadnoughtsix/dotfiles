# ~/.bashrc
#
export PATH="$HOME/bin:$HOME/.gem/ruby/2.4.0/bin:$PATH"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias pacman='sudo pacman'
alias mount='sudo mount'
alias umount='sudo umount'
alias ls='ls --color=auto -laiF'

# SSH aliases
alias utmdev='ssh cabaclar@cslinux.utm.utoronto.ca'

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

readonly RED='\[\033[0;31m\]'
readonly RED_BOLD='\[\033[1;31m\]'
readonly GREEN='\[\033[0;32m\]'
readonly GREEN_BOLD='\[\033[1;32m\]'
readonly BLUE='\[\033[0;34m\]'
readonly BLUE_BOLD='\[\033[1;34m\]'
readonly CYAN='\[\033[0;36m\]'
readonly CYAN_BOLD='\[\033[1;36m\]'
readonly PURPLE='\[\033[0;35m\]'
readonly PURPLE_BOLD='\[\033[1;35m\]'
readonly YELLOW='\[\033[0;33m\]'
readonly YELLOW_BOLD='\[\033[1;33m\]'
readonly RESET='\[\033[m\]'
readonly WHITE_BOLD='\[\033[1;37m\]'

PS1="[\t][${GREEN_BOLD}\u@${RESET}${CYAN_BOLD}\H${RESET}:${RED_BOLD}\w${RESET}]\$ "

