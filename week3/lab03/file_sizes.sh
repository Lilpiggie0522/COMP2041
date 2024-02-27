#! /usr/bin/env dash
SMALL="Small files:"
MEDIUM="Medium-sized files:"
LARGE="Large files:"
FILES=$(ls)
for file in $FILES
do
    LINE=$(< "$file" wc -l)
    if [ "$LINE" -lt 10 ]
    then
        SMALL="$SMALL $file"
    elif [ "$LINE" -ge 10 ] && [ "$LINE" -lt 100 ]
    then
        MEDIUM="$MEDIUM $file"
    else
        LARGE="$LARGE $file"
    fi
done
    echo "$SMALL"
    echo "$MEDIUM"
    echo "$LARGE"
    exit 0;