#!/bin/bash
#
# Copyright 2015 Axel Huebl
#
# ISC Software License
#
commonNodeName=$1

if [ -z "$commonNodeName" ]
then
  echo "Missing first argument (common part of the nodes' name)"
  exit 1
fi

nodes_all=`pbsnodes -l all | grep $commonNodeName | wc -l`
nodes_down=`pbsnodes -l all | grep $commonNodeName | grep down | wc -l`
nodes_offline=`pbsnodes -l all | grep $commonNodeName | grep offline | wc -l`
nodes_job=`pbsnodes -l all | grep $commonNodeName | grep job | wc -l`
nodes_free=`pbsnodes -l all | grep $commonNodeName | grep free | wc -l`

echo "--------------------------"
echo "$commonNodeName nodes:"
echo "--------------------------"
echo -e "All   Off   Job   Free\n
      $nodes_all  -$(( nodes_down + nodes_offline))   $nodes_job  $nodes_free" | column -t
