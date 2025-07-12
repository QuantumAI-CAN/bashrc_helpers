#!/bin/bash
source /home/admin/bashrc_helpers/prompt/prompt_common.sh

################################################################################################
# Usage                 : Script to remove spaces and Replace by period (.) in all the Movies   #
# Author                : Iqbal                                                                 #
# Last Modified Date    : 22-APR-2022                                                           #
################################################################################################

set -uo pipefail

doWork() {
   read -p "Are you sure you want to continue Creating Folder and Moving mkv files? <y/N> " prompt
   if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then

      ################################################################################################
      #
      # Create and Move *.mkv Files in Directory
      #
      ################################################################################################

      for Mfile in *.mkv; do
         if [[ -f "$Mfile" && -e "$Mfile" ]]; then
            echo -e "$BGreen Creating Folder and Moving $Color_Off $BYellow[ $Mfile $BYellow]$Color_Off $BGreen Please Wait...... $Color_Off"
            newfilename=$(/home/admin/bashrc_helpers/scripts/Remove-Space.sh "$Mfile")
            mv "$Mfile" "$newfilename"
            base_folder=$(basename "$newfilename" ".mkv")
            NewFolder=$(/home/admin/bashrc_helpers/scripts/Remove-Space.sh "$base_folder")
            mkdir -p "${NewFolder}" && mv "${newfilename}" "${NewFolder}"
         else
            echo -e "$BRed No file exists with extension .mkv Moving on to Next file...... $Color_Off"
         fi
      done

      ################################################################################################
      #
      # Create and Move *.mp4 Files in Directory
      #
      ################################################################################################

      for Mpfile in *.mp4; do
         if [[ -f "$Mpfile" && -e "$Mpfile" ]]; then
            echo -e "$BGreen Creating Folder and Moving $Color_Off $BYellow[ $Mpfile $BYellow]$Color_Off $BGreen Please Wait...... $Color_Off"
            newfilename=$(/home/admin/bashrc_helpers/scripts/Remove-Space.sh "$Mpfile")
            mv "$Mpfile" "$newfilename"
            base_folder=$(basename "$newfilename" ".mp4")
            NewFolder=$(/home/admin/bashrc_helpers/scripts/Remove-Space.sh "$base_folder")
            mkdir -p "${NewFolder}" && mv "${newfilename}" "${NewFolder}"
         else
            echo -e "$BRed No file exists with extension .mp4 Moving on to Next file...... $Color_Off"
         fi
      done

   else
      exit 0
   fi
}

doWork "$@"

