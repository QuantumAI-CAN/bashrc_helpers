#!/bin/bash

################################################################################################
# Usage                 : Script to remove spaces and Replace by period (.) in all the Movies   #
# Author                : Iqbal                                                                 #
# Last Mofified Date    : 22-APR-2022                                                           #
################################################################################################

read -p "Are you sure you want to continue to Cleanup The File Names? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
 echo "Correcting File Names, Please Wait......"
 find . \( -name "* *" -o -name "*\[*" -o -name "*\(*" -o -name "*-*" -o -name "*_*" -o -name "*=*"  -o -name "*.*" \)| sed 's|^./||'|awk '{print $0}' | sort -nr |grep -v 'DS_Store'|\
  while read f; do 
	base=$(basename "$f" | sed 's|^./||')
#	echo $base; exit
	newbase="${base// /.}"
        newFileName=$(/home/admin/bashrc_helpers/scripts/Remove-Space.sh "$newbase")
        mv "$(dirname "$f" | sed 's|^./||')/$(basename "$f")" "$(dirname "$f" | sed 's|^./||')/$newFileName";
  done
else
  exit 0
fi
