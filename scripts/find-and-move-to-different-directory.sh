#!/bin/sh
read -p "Are you sure you want to continue? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
  find -L $2/ -name "*${1}*" -exec mv {} $3/ \;
else
  exit 0
fi
