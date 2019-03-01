#!/bin/bash - 
#===============================================================================
#
#          FILE: build_unit_local_tests.sh
# 
#         USAGE: ./build_unit_local_tests.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kacper Kowalski (kk), kacper.kowalski@lerta.energy
#  ORGANIZATION: Lerta
#       CREATED: 18.02.2019 14:02
#      REVISION:  ---
#===============================================================================

# Exit on first error, treat unset variables as an error, exit pipe after the first failure.
set -euo pipefail

pushd .
cd ../build/ul_test
make
popd
