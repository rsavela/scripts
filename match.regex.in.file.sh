#!/bin/bash

# Matches a regular expression in a file
#

tail -f <filename> | while read LINE
do
  [[ "{LINE} =~ "A-Z+0-9" ]] && pkill -P $$ tail
done
