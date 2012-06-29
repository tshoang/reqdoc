default: reqdoc.pdf sample-normal.pdf sample-compact.pdf

reqdoc.pdf: reqdoc.sty
	pdflatex reqdoc.dtx
	makeindex -s gglo.ist -o reqdoc.gls reqdoc.glo
	makeindex -s gind.ist -o reqdoc.ind reqdoc.idx
	pdflatex reqdoc.dtx

reqdoc.sty: reqdoc.ins reqdoc.dtx
	pdflatex reqdoc.ins

sample-normal.pdf: sample-normal.tex sample-main.tex reqdoc.sty
	pdflatex sample-normal.tex
	pdflatex sample-normal.tex

sample-compact.pdf: sample-compact.tex sample-main.tex reqdoc.sty
	pdflatex sample-compact.tex
	pdflatex sample-compact.tex

clean:
	rm -f *.aux reqdoc.glo reqdoc.gls reqdoc.idx reqdoc.ilg reqdoc.ind *.log reqdoc.toc

cleanall: clean
	rm -f reqdoc.pdf reqdoc.sty sample-normal.pdf sample-compact.pdf

