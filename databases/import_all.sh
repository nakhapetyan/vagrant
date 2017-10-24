#!/bin/bash
set -o xtrace # show commands

find . -name "*.sql*" | while read file; do
	zcat $file | pv | sudo mysql
done