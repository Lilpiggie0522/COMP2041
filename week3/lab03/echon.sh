#! /usr/bin/env dash

ARGS=$#
REPEAT=""
STRING=""

if test "$ARGS" -ne 2; then
    echo "Usage: $0 <number of lines> <string>" >& 2
    exit 1
else
    REPEAT=$1
    # if ! (echo "$REPEAT" | grep -Eq '^[0-9]+$'); then 
    if ! [ "$REPEAT" -eq "$REPEAT" ] 2> /dev/null || [ "$REPEAT" -lt 0 ] 2> /dev/null; then
        echo "$0: argument 1 must be a non-negative integer"
        exit 1
    else
        STRING=$2
        while test "$REPEAT" -gt 0
        do
            echo "$STRING"
            REPEAT=$((REPEAT-1))
        done
    # if test "$REPEAT" -eq "$REPEAT"; then
    fi
fi

# stirng=''
# string=string+"big"