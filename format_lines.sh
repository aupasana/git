#!/bin/zsh

echo Stripping trailing spaces
perl -i -pe 'BEGIN{undef $/;} s/ *\n/\n/smg' ${1}

echo Adding trailing spaces after any non-empty line
perl -i -pe 'BEGIN{undef $/;} s/([^\n])\n/$1  \n/smg' ${1}

#echo Adding trailing spaces after EOL puncuation
#perl -i -pe 'BEGIN{undef $/;} s/([-।॥,])\n([^\n])/$1  \n$2/smg' ${1}