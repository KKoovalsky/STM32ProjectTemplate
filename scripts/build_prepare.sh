#!/bin/bash - 
#===============================================================================
#
#          FILE: build_prepare.sh
# 
#         USAGE: ./build_prepare.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kacper Kowalski (kk), kacper.kowalski@lerta.energy
#  ORGANIZATION: Lerta
#       CREATED: 07.02.2019 13:37
#      REVISION:  ---
#===============================================================================

# Exit on first error, treat unset variables as an error, exit pipe after the first failure.
set -euo pipefail

if [ -z "${1+x}" ] ; then
    BUILD_TYPE="Debug"
else
    BUILD_TYPE="$1"
fi

pushd .
cd ../build/fw
cmake -DTOOLCHAIN_PREFIX="$HOME/ARMToolchain_8-2018-q4" -DSTM32_CHIP=STM32L071KB \
	-DCMAKE_TOOLCHAIN_FILE="../../cmake/gcc_stm32.cmake" -DCMAKE_BUILD_TYPE="${BUILD_TYPE}" ../..
popd


