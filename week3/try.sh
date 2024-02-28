#! /usr/bin/dash

if test $# -eq 3 2> /dev/null
then
    : echo "gg"
else
    echo "Usage $0 <url> <regex> <email>"
fi