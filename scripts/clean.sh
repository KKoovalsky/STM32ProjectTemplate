#!/bin/bash - 
#===============================================================================
#
#          FILE: clean.sh
# 
#         USAGE: ./clean.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kacper Kowalski (kk), kacper.kowalski@lerta.energy
#  ORGANIZATION: Lerta
#       CREATED: 08.02.2019 11:16
#      REVISION:  ---
#===============================================================================

# Exit on first error, treat unset variables as an error, exit pipe after the first failure.
set -euo pipefail

rm -r ../build/fw/*

