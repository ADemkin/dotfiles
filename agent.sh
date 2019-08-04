#!/bin/sh -e

if [ "$#" = "0" ]; then
    echo "usage: agent.sh [path/to/socket]"
    exit 1
fi

if [ ! -S $1 ]; then
    eval $(ssh-agent -a $1)
    ssh-add -A
fi
