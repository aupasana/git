
#!/bin/zsh

# anudatta before non-standard anusvara
perl -i -pe 's/॒/॒/g' ${1}

# non-standard anusvara
perl -i -pe 's//ं/g' ${1}

# non-standard svarita
perl -i -pe 's//॑/g' ${1}

# non-standard gum
perl -i -pe 's//ꣳ/g' ${1}

# 
perl -i -pe 's/ँ/ꣳ/g' ${1}
perl -i -pe 's/ँ॑//g' ${1}
perl -i -pe 's/ꣳ॒//g' ${1}
perl -i -pe 's/ꣳ᳚//g' ${1}



