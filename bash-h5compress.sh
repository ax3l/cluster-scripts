#!/usr/bin/env bash
#
# Copyright 2015-2016 Axel Huebl
#
# ISC License
#
if [ -z "$1" ]
then
  echo "This script compresses all found HDF5 files in a given"
  echo "directory recursively."
  echo "Although compression and move are done sequentially,"
  echo "try not to abort it half-way (e.g., run in a `screen`)."
  echo ""
  echo "By default, this script will compress up to 8 files in"
  echo "parallel."
  echo ""
  echo "$0 /path/to/dir"
  exit 1
fi

find $1 -name "*.h5" | xargs -n1 -P8 -I{} \
    sh -c 'echo "compress $1 ..." && \
    h5repack -i $1 -o $1.gz -f GZIP=1 && mv $1.gz $1' _ {}
