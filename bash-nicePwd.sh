#!/bin/bash
#
# Copyright 2013-2015 Axel Huebl
#
# ISC Software License
#
# Shortens the `pwd` to a useful length,
# nice to keep your PS1 prompt clean
#
# The result is written in the var $myPWD
nice_pwd()
{
    # replace first match
    myPWD=${PWD/"$HOME"/\~}
    local maxlen=18
    if [ ${#myPWD} -gt $maxlen ]; then myPWD="..."${myPWD: -$maxlen}; fi
}
