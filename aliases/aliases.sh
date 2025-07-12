#!/bin/bash

# Copyright (c) 2012 Adam Matan <adam@matan.name>
# See the file license.txt for copying permission.

alias gerp='grep'  		     # Helps with Dislexya
alias rsyn='rsync -avzr --progress'  # I want this for every remote sync
alias wgeto='wget -qO- '	     # wget to standard output
alias tailf='tail -f '		     

# Ubuntu
alias srch='apt-cache search'
alias sair='sudo apt-get install'

# Unix
alias hid='ls -ld .?*'
alias cls='clear'
alias ll='ls -l --color=auto'
alias vi='/opt/bin/nvim'
alias vim='/opt/bin/nvim'
alias nvi='/opt/bin/nvim'
alias x='exit'
alias f='findInAllFlicks.sh'
alias root='sudo su -'


alias 1c='cd /home/admin/Website-Making/NodeJs-Projects/first-choice'
alias cleanAOC='rm -rf AOC.nfo Sample.mkv Screens *.png *iNFO.nfo *Sample* Extras *.tmp'
alias flicks='cd /volume1/Movies/English/'
alias dow='cd /volume1/Download/flicks'
alias MF='cd /volume1/Download/MoveMe'
alias BMF='cd /volume1/Download/Big-Movies-Files'
alias dotfiles='cd /home/admin/bashrc_helpers'
alias moveflicks='mv /volume1/Download/flicks/* /volume1/Movies/English/'
alias moveMoveMeFlicks='mv /volume1/Download/MoveMe/* /volume1/Movies/English/'
alias DeleteJPG='find . -name '*.jpg' -exec rm {} \;'
alias MMM='mv /volume1/Download/MoveMe/* /volume1/Movies/English/'
#alias runCleanOnPWD='for i in $(ls); do cd $i; cleanAOC; cd ..; tree; done'
alias RunCleanOnPWD='read -p "Are you sure you want to continue to Cleanup The File Names? <y/N> " prompt; if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then echo "Correcting File Names, Please Wait......"; for i in $(ls); do cd $i; rm -rf BDInfo.txt AOC.nfo Sample.mkv Screens *.png *iNFO.nfo *Sample* Extras *.tmp; cd ..; done; fi; tree'
