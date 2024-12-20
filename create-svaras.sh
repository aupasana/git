#!/bin/zsh

cp ${1} tmp/${1:t}
./format_svaras.sh tmp/${1:t}
./create.sh tmp/${1:t}
