
#!/bin/zsh

###
### The following use glyphs from the private font use area
### and don't work on a kindle. You can enable them for pdfs.
###

# use .gm swaras from private area
perl -i -pe 's/ँ/ꣳ/g' ${1}
perl -i -pe 's/ँ॑//g' ${1}
perl -i -pe 's/ꣳ॒/॒/g' ${1}
perl -i -pe 's/ꣳ᳚//g' ${1}

# use .ggm swaras from private area
perl -i -pe 's/॑ꣴ//g' ${1}
perl -i -pe 's/᳚ꣴ//g' ${1}
perl -i -pe 's/॒ꣴ/॒/g' ${1}

# remove duplicates
perl -i -pe 's/॑॑/॑/g' ${1}
perl -i -pe 's/᳚᳚/᳚/g' ${1}



