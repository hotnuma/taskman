#!/usr/bin/bash

BASEDIR="$(dirname -- "$(readlink -f -- "$0";)")"

./autogen.sh --enable-debug=no && make && sudo make install-strip


