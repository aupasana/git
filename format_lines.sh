#!/bin/zsh

echo Stripping trailing spaces
perl -i -pe 'BEGIN{undef $/;} s/ *\n/\n/smg' ${1}

#echo Adding newline on shloka boundaries
#perl -i -pe 'BEGIN{undef $/;} s/॥\n([^\n])/॥\n\n$1/smg' ${1}

echo Adding trailing spaces after any non-empty line, which is not followed by a blank line
perl -i -pe 'BEGIN{undef $/;} s/([^\n])\n/$1  \n/smg' ${1}

# perl -i -pe 'BEGIN{undef $/;} s/([^।॥]+)\n/$1।\n/smg' suktas/rudra-krama.md
# perl -i -pe 'BEGIN{undef $/;} s/\n।\n/\n\n/smg' suktas/rudra-krama.md
# perl -i -pe 'BEGIN{undef $/;} s/ ।\n/।/smg' suktas/rudra-krama.md


echo Remove spaces before . and ..
perl -i -pe 's/ ।/।/g' ${1}
perl -i -pe 's/ ॥/॥/g' ${1}

echo Remove spaces at beginning of line
#perl -i -pe 'BEGIN{undef $/;} s/( )*।/।\n/smg' ${1}
#perl -i -pe 'BEGIN{undef $/;} s/( )*॥/॥\n/smg' ${1}

#echo Adding trailing spaces after EOL puncuation
#perl -i -pe 'BEGIN{undef $/;} s/([-।॥,])\n([^\n])/$1  \n$2/smg' ${1}

echo Exiting format_lines.sh