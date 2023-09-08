DISTPKG =	uubeamer-0.3pre3.tar.gz
DISTFILES =	AUTHORS README INSTALL NEWS \
		Makefile \
		art/ doc/ misc/ themes/
DISTEXCLUDES =  --exclude .svn \
		--exclude Makefile.in \
		--exclude misc/uubeamerversion.sty.in

docs:
	(cd doc/; make)

# creates a distribution package, e.g. uubeamer-0.2.tar.gz
# All package files in the archive will be in a toplevel dir 'uubeamer'
# package creation is done in a temporary directory 'tmpdist'
dist:
	mkdir tmpdist 2>/dev/null || rm -rf tmpdist/*
	tar cf tmpdist/tmpdist.tar $(DISTFILES) $(DISTEXCLUDES)
	(cd tmpdist/ \
	 	&& mkdir uubeamer \
		&& cd uubeamer/ \
		&& tar xf ../tmpdist.tar \
		&& cd .. \
		&& tar zcvf $(DISTPKG) uubeamer/)
	mv tmpdist/$(DISTPKG) .
	rm -rf tmpdist/
