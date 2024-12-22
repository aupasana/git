
#!/bin/zsh

re_options="-i -pe"
#####
##### Replace glyphs from private use areas
#####


perl $re_options 's/॒ः/ः॒/g' ${1}

perl $re_options 's/᳚/॑॑/g' ${1}

# anudatta before non-standard anusvaraperl ${re_options} 's/॒/॒/g' ${1}

# non-standard anusvara
perl $re_options 's//ं/g' ${1}

# non-standard svarita
perl $re_options 's//॑/g' ${1}

# non-standard gum
perl $re_options 's//ꣳ/g' ${1}
perl $re_options 's//ꣳ/g' ${1}

# non-standard H
perl $re_options 's//ः/' ${1}

####
####  Format .gm and .gg properly
####

perl $re_options 's/ँ॒/॒ꣳ॒/g' ${1}

perl $re_options 's/ँ॑/ꣳ॑/g' ${1}

perl $re_options 's/ँ॑/ꣳ॑/g' ${1}

perl $re_options 's/ँ᳚/ꣳ᳚/g' ${1}

perl $re_options 's/॑ꣴ/ꣴ॑/g' ${1}

perl $re_options 's/॒ꣴ/॒ꣴ॒/g' ${1}

perl $re_options 's/᳚ꣴ/ꣴ᳚/g' ${1}

perl $re_options 's/ँ/ꣳ/g' ${1}

### Remove duplicats
perl $re_options 's/॒॒/॒/g' ${1}


####
#### Format H properly

perl $re_options 's/॑ः/ः॑/g' ${1}
perl $re_options 's/।/।/g' ${1}
####

####
#### Don't show properly on kindle
####


