#!/bin/bash

################################################################################
# Usage			:Script to remove spaces and Replace by period (.)  	#	
# Author 		: Iqbal							#
# Last Mofified Date	: 22-APR-2022 						#
################################################################################


RmSpaceFromSting=$(echo "$1" \
 |sed 's/{/\./g'| sed 's/}/\./g' | sed 's/ /\./g' |sed 's/\:/./g' |sed 's/-/\./g' | sed 's/\.-\./\./g'| sed 's/\.\./\./g'  \
 |sed 's/,/./g' | sed 's/\[Hindi\]\.//g' | sed 's/(/\./g' |sed 's/)/\./g' | sed 's/\[//g' | sed 's/\]//g'| sed 's/\.\./\./g' \
 |sed 's/\+/./g' | sed 's/\@/./g' | sed 's/\_/./g' | sed 's/\.\./\./g'|sed 's/=//g' | sed  's/\[-=BlacK_PearL=-\]/BlacK_PearL/g' |sed 's/\.$//g' \
 |sed 's/\+/./g' | sed 's/\@/./g' | sed 's/\_/./g' | sed 's/\.\./\./g'|sed 's/=//g' \
# |awk 'BEGIN{FS=OFS="."} {for (i=1;i<NF;i++) {$i=toupper(substr($i,1,1)) tolower(substr($i,2))}}1' \
# |awk 'BEGIN{FS=OFS="."} {for (i=1;i<NF;i++) {$i=toupper(substr($i,1,1)) substr($i,2)}}1' \
 )

if [[ "$2" == "I" || "$2" == "i" ]]
then
  InitialCapital=$(echo "$RmSpaceFromSting" | awk 'BEGIN{FS=OFS="."} {for (i=1;i<NF;i++) {$i=toupper(substr($i,1,1)) tolower(substr($i,2))}}1')
  echo -en "\n------------ Initial Capital --------------"
  echo -en "\n$InitialCapital"
  printf "\n"
  echo -en "\n------------ Removed Spaces  --------------"
  echo -en "\n$RmSpaceFromSting"
  echo -en "\n                                                                                                                                                                     ."
  printf "\n"
else
  echo "$RmSpaceFromSting"
fi

