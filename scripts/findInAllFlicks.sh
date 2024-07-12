#!/bin/bash -eu

########################################################################################
# Usage			: Script to find specified movie name from /volumn1/Movies	#	
# Author 		: Iqbal								#
# Last Mofified Date	: 22-APR-2022 							#
########################################################################################

fname=
export fname
function has-space {
  [[ "$1" != "${1%[[:space:]]*}" ]] && return 0 || return 1
}

if has-space "$1"; then
  fname=$(/home/admin/bashrc_helpers/scripts/Remove-Space.sh "$1")
  export fname
fi

if ! has-space "$1" ; then
  fname=$(/home/admin/bashrc_helpers/scripts/Remove-Space.sh "$1")
  export fname
fi

find -L /volume1/Movies/* -type d -iname "*$fname*" -exec du -sh {} \; | grep -v backdrop

