# pandoc cms-vishnu.md -o cms-vishnu.epub --toc --epub-embed-font=siddhanta-cakravat.ttf

pandoc cms-gita-2024.md -o epub/cms-gita.epub --toc 
pandoc cms-gita-roman-2024.md -o epub/cms-gita-roman.epub --toc 

ebook-convert epub/cms-gita.epub epub/cms-gita.pdf --paper-size=a6 --pdf-page-margin-left=5 --pdf-page-margin-right=5 --pdf-page-margin-top=25 --pdf-page-margin-bottom=25

ebook-convert epub/cms-gita-roman.epub epub/cms-gita-roman.pdf --paper-size=a6 --pdf-page-margin-left=5 --pdf-page-margin-right=5 --pdf-page-margin-top=25 --pdf-page-margin-bottom=25

#pandoc cms-vishnu.md -o epub/cms-vishnu.epub --toc && open epub/cms-vishnu.epub
