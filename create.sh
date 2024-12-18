#!/bin/zsh

file_base=${1:r}
pdf_params="--paper-size=a6 --pdf-page-margin-left=5 --pdf-page-margin-right=5 --pdf-page-margin-top=25 --pdf-page-margin-bottom=25"


echo Creating devanagari files
pandoc ${file_base}.md -o epub/${file_base}-devanagari.epub --toc --epub-embed-font=fonts/siddhanta-cakravat.ttf 
pandoc ${file_base}.md -o epub/${file_base}-devanagari.html --toc 

ebook-convert epub/${file_base}.epub epub/${file_base}-devanagari.pdf $=pdf_params --embed-all-fonts --embed-font-family=Siddhanta-cakravat
# ebook-convert epub/${file_base}.epub epub/${file_base}-devanagari.pdf $=pdf_params --embed-all-fonts --embed-font-family=Sanskrit2003

# return

echo Creating IAST
sanscript  -i ${file_base}.md --from devanagari --to iast -o tmp/${file_base}-iast.md
pandoc tmp/${file_base}-iast.md -o epub/${file_base}-iast.epub --toc 
ebook-convert epub/${file_base}-iast.epub epub/${file_base}-iast.pdf $=pdf_params

echo Creating Kannada
sanscript  -i ${file_base}.md --from devanagari --to kannada -o tmp/${file_base}-kannada.md
pandoc tmp/${file_base}-kannada.md -o epub/${file_base}-kannada.epub --toc 
ebook-convert epub/${file_base}-kannada.epub epub/${file_base}-kannada.pdf $=pdf_params

echo Creating Telugu
sanscript  -i ${file_base}.md --from devanagari --to telugu -o tmp/${file_base}-telugu.md
pandoc tmp/${file_base}-telugu.md -o epub/${file_base}-telugu.epub --toc 
ebook-convert epub/${file_base}-telugu.epub epub/${file_base}-telugu.pdf $=pdf_params

