#!/bin/bash - 
#===============================================================================
#
#          FILE: build_prepare_unit_local_tests.sh
# 
#         USAGE: ./build_prepare_unit_local_tests.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kacper Kowalski (kk), kacper.kowalski@lerta.energy
#  ORGANIZATION: Lerta
#       CREATED: 18.02.2019 13:42
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
cd ../build/ul_test
cmake -DCMAKE_BUILD_TYPE="${BUILD_TYPE}" -DUNIT_TEST_LOCAL=1 ../..
popd


