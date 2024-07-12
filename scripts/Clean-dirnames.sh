#!/bin/bash

################################################################################################
# Usage                 : Script to remove spaces and Replace by period (.) in all the Movies   #
# Author                : Iqbal                                                                 #
# Last Mofified Date    : 22-APR-2022                                                           #
################################################################################################

read -p "Are you sure you want to continue to Cleanup The File Names? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
 echo "Correcting Directories:: Names, Please Wait......"
 find . -maxdepth 1 -type d |grep -v '\.$' | while read f; do base=$(basename "$f");
        newFileName=$(remove-space.sh "$base")
        mv "$base" "$newFileName";
	cd $newFileName
	find . \( -name "* *" -o -name "*\[*" -o -name "*\(*" -o -name "*-*" -o -name "*_*" -o -name "*=*" \)|awk '{print $0}' | sort -nr |grep -v 'DS_Store'|\
	while read f; do newbase2=$(basename "$f");
        	newFileName=$(remove-space.sh $newbase2)
        	mv "$(dirname "$f")/$(basename "$f")" "$(dirname "$f")/$newFileName";
  done

  done
else
  exit 0
fi
