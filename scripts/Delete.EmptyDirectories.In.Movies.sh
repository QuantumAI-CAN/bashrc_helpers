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
 find . \( -name "* *" -o -name "*\[*" -o -name "*\(*" -o -name "*-*" -o -name "*_*" -o -name "*=*" \)|awk '{print $0}' | sort -nr |grep -v 'DS_Store'|\
  while read f; do base=$(basename "$f");initbase=`echo $base 
        sed 's/=//g' |\
        sed 's/{/\./g'| sed 's/}/\./g' | sed 's/ /\./g' |sed 's/\:/./g' |sed 's/-/\./g' | sed 's/\.-\./\./g'| sed 's/\.\./\./g' | sed 's/,/./g' |\
        sed 's/\[Hindi\]\.//g' | sed 's/(/\./g' | sed 's/)/\./g' | sed 's/\[//g' | sed 's/\]//g'| sed 's/\.\./\./g' | sed 's/\+/./g' | sed 's/\@/./g' |\
        sed 's/\_/./g' | sed 's/\.\./\./g' | sed 's/\.\./\./g' | sed 's/\[Hindi\]\.//g' | sed 's/(//g' |sed 's/)//g' | sed 's/\[//g' | sed 's/\]//g'|\
        sed 's/\.\./\./g'| sed 's/-/\./g'| sed 's/\=/\./g'| sed 's/\.\./\./g'| sed 's/\.\./\./g'`; newbase="${initbase// /.}"; \
        newbase2=`echo $newbase |awk 'BEGIN{FS=OFS="."} {for (i=1 ; i <= NF ; i++) {sub(substr($i,2),tolower(substr($i,2)),$i)} print }'` ;\
        newFileName=$(remove-space.sh $newbase2)
        mv "$(dirname "$f")/$(basename "$f")" "$(dirname "$f")/$newFileName";
  done
else
  exit 0
fi
