#!/bin/bash - 
#===============================================================================
#
#          FILE: build.sh
# 
#         USAGE: ./build.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kacper Kowalski (kk), kacper.kowalski@lerta.energy
#  ORGANIZATION: Lerta
#       CREATED: 07.02.2019 13:48
#      REVISION:  ---
#===============================================================================

# Exit on first error, treat unset variables as an error, exit pipe after the first failure.
set -euo pipefail

pushd .
cd ../build/fw
make
popd
