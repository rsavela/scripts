#!/bin/bash

#
# Waits for a file to be created.
#

while [ ! -f <filename> ]; do sleep 1; done

