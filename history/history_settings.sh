#!/bin/bash

# Copyright (c) 2012 Adam Matan <adam@matan.name>
# See the file license.txt for copying permission.

# Inspired by http://stackoverflow.com/a/104056/51197


#export HISTFILE="$HOME/.bash_history"
#export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
##export HISTSIZE=				#Unlimited Size
#export HISTSIZE=1000000
##export HISTFILESIZE=				# Unlimited history file size
#export HISTFILESIZE=1000000
##export HISTTIMEFORMAT='%F %T '
#export HISTTIMEFORMAT="[ %m-%d-%Y %T ] "
#
#shopt -s histappend				# append to history, don't overwrite it
#
## Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#

# Consistent and forever bash history
HISTSIZE=1000000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups:erasedups		#no duplicate entries
HISTFILE="$HOME/.bash_history"

_bash_history_sync() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
}

_bash_history_sync_and_reload() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
  builtin history -c         #3
  builtin history -r         #4
}

history() {                  #5
  _bash_history_sync_and_reload
  builtin history "$@"
}

#export HISTTIMEFORMAT="%y/%m/%d %H:%M:%S   "
export HISTTIMEFORMAT="[ %m-%d-%Y %T ]   "
PROMPT_COMMAND='history 1 >> ${HOME}/.bash_eternal_history'
PROMPT_COMMAND=_bash_history_sync;$PROMPT_COMMAND

