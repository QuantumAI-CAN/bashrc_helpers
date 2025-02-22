#!/bin/bash

#############################################################################
# Usage					:Script to remove spaces and Replace by period (.)	#
# Author 				: Iqbal												#
# Last Mofified Date	: 22-APR-2022 										#
#############################################################################


RmSpaceFromSting=$(echo "$1" \
 |sed 's/{/\./g'| sed 's/}/\./g' | sed 's/ /\./g' |sed 's/\:/./g' |sed 's/-/\./g' | sed 's/\.-\./\./g'| sed 's/\.\./\./g'  \
 |sed 's/,/./g' | sed 's/\[Hindi\]\.//g' | sed 's/(/\./g' |sed 's/)/\./g' | sed 's/\[//g' | sed 's/\]//g'| sed 's/\.\./\./g' \
 |sed 's/\+/./g' | sed 's/\@/./g' | sed 's/\_/./g' | sed 's/\.\./\./g' \
 )

if [[ "$2" == "I" || "$2" == "i" ]]
then
  InitialCapital=$(echo "$RmSpaceFromSting" | awk 'BEGIN{FS=OFS="."} {for (i=1;i<NF;i++) {$i=toupper(substr($i,1,1)) tolower(substr($i,2))}}1')
  echo -en "\n$InitialCapital"
  echo -en "\n                                                                                                                              .                                                                            . \n"
  echo -en "\n$RmSpaceFromSting"
  echo -en "\n                                                                                                                              .                                                                            . \n"
  printf "\n"
else
  echo "$RmSpaceFromSting"
fi



