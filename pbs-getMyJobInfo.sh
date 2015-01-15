#!/bin/bash
#
# Copyright 2013-2015 Axel Huebl
#
# ISC Software License
#
# get waiting|running|errored jobs of mine in all queues
#
# written to $HOME/.getShortUserInfo.txt
# so one can add it to a PS1 prompt
qstat=/opt/torque/bin/qstat
clusterName="hypnos"

myJobs=`$qstat -u $( whoami ) -n1 | egrep "^*\."$clusterName | tr -s ' ' | cut -d' ' -f10 | sort`

numQ=`echo "$myJobs" | egrep "Q" | wc -l`
numR=`echo "$myJobs" | egrep "R|C" | wc -l`
numE=`echo "$myJobs" | egrep "E" | wc -l`

echo "($numQ|$numR|$numE)" > $HOME/.getShortUserInfo.txt
