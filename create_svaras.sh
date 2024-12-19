#!/bin/zsh

cp ${1} tmp/${1}
./format_svaras.sh tmp/${1}
./create.sh tmp/${1}
