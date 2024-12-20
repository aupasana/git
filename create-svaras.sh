#!/bin/zsh

file_base=${1:r}
file_base=${file_base:t}

cp ${1} tmp/${1:t}

echo calling ./format_svaras.sh tmp/${1:t}
./format_svaras.sh tmp/${1:t}

echo calling ./format_lines.sh tmp/${1:t}
./format_lines.sh tmp/${1:t}

# return 

pdf_params="--paper-size=a5 --pdf-page-margin-left=36 --pdf-page-margin-right=36 --pdf-page-margin-top=36 --pdf-page-margin-bottom=36 --pdf-page-numbers"

echo Creating devanagari files
pandoc tmp/${file_base}.md -o epub/${file_base}-devanagari.epub

echo Converting to pdf
ebook-convert epub/${file_base}-devanagari.epub pdf/${file_base}-devanagari.pdf $=pdf_params 
