#! /bin/bash

if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
    cat ~/.cache/wal/sequences
	exec fish
fi
