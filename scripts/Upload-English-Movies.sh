#!/bin/sh

read -p "Please Enter Source Folder(To Sync From): " source
read -p "Please Enter Target Folder(Destination) : " target
nohup rsync -avh --progress --stats $source $target &
exit 0


#if [[ $# -eq 2 ]]
#  then
#
#	nohup rsync -avh --progress --stats $source $target &
#	wait 5
#	exit 0	
#  else
#	"Please Enter Source and Target Directories"
#	exit 1
#fi
