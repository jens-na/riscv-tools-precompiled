#!/bin/bash

# The MIT License (MIT)
# Copyright (c) 2018, Jens Nazarenus
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
# OR OTHER DEALINGS IN THE SOFTWARE.

RISCV=`pwd`/tmp/install
BUILDS_DIR=`pwd`/builds
BUILD_APP=
BUILD_APP_SHORT=

# Build script
if [ $# -ne 1 ]; then
    echo "No build application specified. [build-rv32ima.sh, build.sh]"
    exit 1
fi
BUILD_APP=$1
BUILD_APP_SHORT=`echo $BUILD_APP | sed 's/\.sh$//g'`

echo $BUILD_APP_SHORT

# Prepare riscv-tools
mkdir -p tmp/install && cd tmp
git clone https://github.com/riscv/riscv-tools.git
cd riscv-tools
git submodule update --init --recursive

# Build riscv-tools
export RISCV
eval ./$BUILD_APP

# Archive and compress
tar cfvz - -C $RISCV . | split --numeric-suffixes --bytes=20MB - $BUILDS_DIR/$BUILD_APP_SHORT.tar.gz.
