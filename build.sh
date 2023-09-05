#!/bin/bash

set -euo pipefail

rm -f pdfs/*.pdf
ls -l
for DIR in problems themes notes
do
    cd $DIR

    pdflatex -shell-escape -interaction=batchmode $DIR.tex
    pdflatex -shell-escape -interaction=batchmode $DIR.tex
    cp $DIR.pdf ..

    for SUFF in pyg out.pyg aux nav toc log out snm vrb pdf
    do
        rm -f $DIR.$SUFF
    done

    cd ..
done

ls -l
