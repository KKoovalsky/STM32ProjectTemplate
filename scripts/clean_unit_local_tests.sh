#!/bin/bash - 
#===============================================================================
#
#          FILE: clean_unit_local_tests.sh
# 
#         USAGE: ./clean_unit_local_tests.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kacper Kowalski (kk), kacper.kowalski@lerta.energy
#  ORGANIZATION: Lerta
#       CREATED: 18.02.2019 14:00
#      REVISION:  ---
#===============================================================================

# Exit on first error, treat unset variables as an error, exit pipe after the first failure.
set -euo pipefail

rm -r ../build/ul_test/*

