#!/bin/bash - 
#===============================================================================
#
#          FILE: repo_prepare.sh
# 
#         USAGE: ./repo_prepare.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kacper Kowalski (kk), kacper.kowalski@lerta.energy
#  ORGANIZATION: Lerta
#       CREATED: 27.02.2019 12:31
#      REVISION:  ---
#===============================================================================

# Exit on first error, treat unset variables as an error, exit pipe after the first failure.
set -euo pipefail

mkdir -p ../build/{drv_test,fw,ul_test,url_test}


