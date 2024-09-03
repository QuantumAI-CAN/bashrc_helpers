#!/bin/bash

################################################################################################
# Usage                 : Script to remove spaces and Replace by period (.) in all the Movies	#
# Author 		: Iqbal									#
# Last Mofified Date	: 22-APR-2022 								#
################################################################################################

set -uo pipefail

doWork() {
#    dir="${1}"
#    cd "${dir}" || return
read -p "Are you sure you want to continue Creating Folder and Moving mkv files? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
 echo "Creating Folder and Moving mkv files, Please Wait......"
    for file in *.mkv; do
       base_folder=$(basename "$file" ".mkv")
       NewFolder=$(/home/admin/bashrc_helpers/scripts/Remove-Space.sh "$base_folder")
#       mkdir -p "${folder}" && mv "${folder}".* "${folder}"
       mkdir -p "${NewFolder}" && mv "${base_folder}".* "${NewFolder}"
    done
else
  exit 0
fi
}

doWork "$@"
