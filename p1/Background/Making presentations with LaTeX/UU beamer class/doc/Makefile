#THEMEFILES = 	../themes/beamerthemeuubeamer.sty \
#		../themes/beamercolorthemeuubeamer.sty \
#		../themes/beamerouterthemeuubeamer.sty
XMPLSOURCES = 	beamerexampleuuplain.tex \
		beamerexampleuufancy.tex
XMPLDEPS =	examplecontents.tex
examples: ${XMPLSOURCES:%.tex=%.pdf}
${XMPLSOURCES:%.tex=%.pdf}: ${XMPLDEPS}

force:
	touch *.tex
	make examples

%.pdf: %.tex
	pdflatex $<
	pdflatex $<

clean:
	rm -rf $(XMPLSOURCES:.tex=.log)
	rm -rf $(XMPLSOURCES:.tex=.aux)
	rm -rf $(XMPLSOURCES:.tex=.nav)
	rm -rf $(XMPLSOURCES:.tex=.out)
	rm -rf $(XMPLSOURCES:.tex=.snm)
	rm -rf $(XMPLSOURCES:.tex=.toc)

