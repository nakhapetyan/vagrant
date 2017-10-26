#!/bin/bash
set -o xtrace # show commands

find `dirname $0` -name "*.sql*" | while read file; do
	zcat -f $file | pv | sudo mysql
done