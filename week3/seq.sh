#! /bin/dash
# --> specifies what interpreter to use

FIRST=""
INCREMENT=""
LAST=""

#Argument Handling

case $# in 
    1) 
        FIRST=1
        LAST=$1
        INCREMENT=1
        ;;
    2)
        FIRST=$1
        LAST=$2
        INCREMENT=1
        ;;
    3)
        FIRST=$1
        LAST=$3
        INCREMENT=$2
        ;;
    *)
        echo "Usage: $0 [FIRST [INCREMENT]] LAST" >& 2
        exit 1
esac

# echo $FIRST
# echo $LAST
# echo $INCREMENT

# Error Checking 
if [ $FIRST -eq $FIRST ] 2> /dev/null; then 
    :
else
    echo "$0: Error <FIRST> must be an integer" >& 2
    exit 1
fi

#Update the below so we check that last is greater than first/bi
if [ $LAST -eq $LAST ] 2> /dev/null; then 
    :
else
    echo "$0: Error <LAST> must be an integer" >& 2
    exit 1
fi


if [ "$INCREMENT" -eq $INCREMENT ] 2> /dev/null; then 
    if [ $INCREMENT -le 0 ] 2> /dev/null; then
        echo "$0: Error <INCREMENT> must be positive" >& 2
        exit 1
    fi
else
    echo "$0: Error <INCREMENT> must be an integer" >& 2
    exit 1
fi

CURRENT="$FIRST"
while [ "$CURRENT" -le "$LAST" ]; do
    echo "$CURRENT"
    CURRENT=$(( CURRENT + INCREMENT))
done