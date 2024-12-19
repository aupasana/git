#!/bin/zsh

file_base=${1:r}
file_base=${file_base:t}
pdf_params="--paper-size=a5 --pdf-page-margin-left=36 --pdf-page-margin-right=36 --pdf-page-margin-top=36 --pdf-page-margin-bottom=36 --pdf-page-numbers"

echo Formatting spacing
cp ${1} tmp/${1:t}
./format_lines.sh tmp/${1:t}

echo Creating devanagari files
pandoc tmp/${file_base}.md -o epub/${file_base}-devanagari.epub --filter ./hx_iast.py
# pandoc tmp/${file_base}.md -o epub/${file_base}-devanagari.epub --toc --epub-embed-font=fonts/siddhanta-cakravat.ttf 

ebook-convert epub/${file_base}-devanagari.epub pdf/${file_base}-devanagari.pdf $=pdf_params --embed-all-fonts --embed-font-family=Siddhanta-cakravat
# ebook-convert epub/${file_base}-kindle.epub epub/${file_base}-kindle.azw3

# ebook-convert epub/${file_base}.epub epub/${file_base}-devanagari.pdf $=pdf_params --embed-all-fonts --embed-font-family=Sanskrit2003


# echo Creating Grantha
# sanscript -i tmp/${file_base}.md --from devanagari --to grantha -o tmp/${file_base}-grantha.md
# pandoc tmp/${file_base}-grantha.md -o epub/${file_base}-grantha.epub # --toc --epub-embed-font=fonts/NotoSerifGrantha-Regular.ttf
#ebook-convert epub/${file_base}-grantha.epub pdf/${file_base}-grantha.pdf $=pdf_params --embed-all-fonts --embed-font-family="Noto Sans Grantha"
# ebook-convert epub/${file_base}-grantha.epub pdf/${file_base}-grantha.pdf $=pdf_params --embed-all-fonts --embed-font-family="Sampradaya"

return

echo Creating IAST
sanscript -i tmp/${file_base}.md --from devanagari --to iast -o tmp/${file_base}-iast.md
pandoc tmp/${file_base}-iast.md -o epub/${file_base}-iast.epub --toc 
ebook-convert epub/${file_base}-iast.epub pdf/${file_base}-iast.pdf $=pdf_params

echo Creating Kannada
sanscript -i tmp/${file_base}.md --from devanagari --to kannada -o tmp/${file_base}-kannada.md
pandoc tmp/${file_base}-kannada.md -o epub/${file_base}-kannada.epub --toc 
ebook-convert epub/${file_base}-kannada.epub pdf/${file_base}-kannada.pdf $=pdf_params

echo Creating Telugu
sanscript -i tmp/${file_base}.md --from devanagari --to telugu -o tmp/${file_base}-telugu.md
pandoc tmp/${file_base}-telugu.md -o epub/${file_base}-telugu.epub --toc 
ebook-convert epub/${file_base}-telugu.epub pdf/${file_base}-telugu.pdf $=pdf_params

echo Creating Malayalam
sanscript -i tmp/${file_base}.md --from devanagari --to malayalam -o tmp/${file_base}-malayalam.md
pandoc tmp/${file_base}-malayalam.md -o epub/${file_base}-malayalam.epub --toc 
ebook-convert epub/${file_base}-malayalam.epub pdf/${file_base}-malayalam.pdf $=pdf_params
