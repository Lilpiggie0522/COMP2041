###
tr
`match chacacters from src to dest`

###
Pipeline
`series of filter seperated by |`

###
head
`head -n3`

###
tr
`tr 'a-zA-Z' 'A-Za-z'` switch around upper and lower case a-z
`tr -d ' ' | wc` deletes all space in line and count no of words
`tr -cs '[:alpha:]' '\n'` moves all words in different lines

###
sort
`sort -k2,2` start sorting from 2nd column and stop
`sort -k3,3 -k2,2` start sorting from 3 and stop, then go back sorting on 2nd
`sort -k1.8,1n benmark.txt`

###
sed
`sed -E '/s/\t0/\t/g'`

