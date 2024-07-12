#!/bin/bash

########################################################################
# Usage					: Script to delete duplicates	#
# Author 				: Iqbal				#
# Last Mofified Date	: 22-APR-2022 					#
########################################################################

sed -i -e "/$1/d" duplicate-movies

