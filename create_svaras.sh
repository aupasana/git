#!/bin/zsh

cp ${1} epub/${1}
./format_svaras epub/${1}
./create.sh epub/${1}
