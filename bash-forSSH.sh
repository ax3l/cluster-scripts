#!/bin/bash
#
# Copyright 2013-2015 Axel Huebl
#
# ISC Software License
#

# example: run for all enumerated nodes
#          an ssh command (libe pdsh)
#
# modify: "%02.f" 1 19: create 001 to 019
#         kepler0     : my current common node name
forNodes()
{
    for i in `seq --format="%02.f" 1 19`; do ssh kepler0$i "$*"; done
}

