#!/bin/env dash
ARGS=$#
YEAR=$1
PREFIX=$2
if test "$ARGS" -ne 2; then
    echo "Usage: $0 <year> <course-prefix>" >& 2
    exit 1
elif [ "$YEAR" -lt 2019 ] || [ "$YEAR" -gt 2023 ]; then
    echo "$0: argument 1 must be an integer between 2019 and 2023" >& 2
    exit 1
else
    curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:"$YEAR"%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:"$PREFIX"*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0 | jq '[.contentlets | .[] | {title: .title, code: .code, year: .implementationYear}]' > raw.json;
    curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:"$YEAR"%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:"$PREFIX"*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0 | jq '[.contentlets | .[] | {title: .title, code: .code, year: .implementationYear}]' >> raw.json
    < raw.json jq -c '.[]'  |
    sed 's/\"//g' |
    cut -d':' -f2,3,4 |
    sed -E 's/code://g' |
    sed -E 's/year://g' |
    sed -E 's/(.*),(.*),(.*)$/\2,\1,\3/' |
    cut -d',' -f1,2 |
    sed -E 's/,/ /g' |
    sort |
    uniq
fi
# curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:2021%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:COMP*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0)
# echo $(curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:2021%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:COMP*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0 | 
# jq '[.contentlets | .[] | {title: .title, code: .code, level: .studyLevel}]') | 
# jq -c '.[]' | 
# grep -E $1