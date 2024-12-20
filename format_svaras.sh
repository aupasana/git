
#!/bin/zsh

#####
##### Replace glyphs from private use areas
#####

# anudatta before non-standard anusvara
perl -i -pe 's/॒/॒/g' ${1}

# non-standard anusvara
perl -i -pe 's//ं/g' ${1}

# non-standard svarita
perl -i -pe 's//॑/g' ${1}

# non-standard gum
perl -i -pe 's//ꣳ/g' ${1}
perl -i -pe 's//ꣳ/g' ${1}

# non-standard H
perl -i -pe 's//ः' ${1}

####
####  Format .gm and .gg properly
####

perl -i -pe 's/ँ॒/॒ꣳ॒/g' ${1}

perl -i -pe 's/ँ॑/ꣳ॑/g' ${1}

perl -i -pe 's/ँ᳚/ꣳ᳚/g' ${1}

perl -i -pe 's/॑ꣴ/ꣴ॑/g' ${1}

perl -i -pe 's/॒ꣴ/॒ꣴ॒/g' ${1}

perl -i -pe 's/᳚ꣴ/ꣴ᳚/g' ${1}

perl -i -pe 's/ँ/ꣳ/g' ${1}

####
#### Format H properly

perl -i -pe 's/॑ः/ः॑/g' ${1}
perl -i -pe 's/।/।/g' {1}
####

####
#### Don't show properly on kindle
####


