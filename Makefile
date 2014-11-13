PACKAGE=binreloc
VERSION=2.0
PREFIX=/usr

.PHONY: all install install-man dist distdir clean

all:
	@echo "There's no need to compile or install anything. Please read README."
	@echo "If you wish to install the man pages, type 'make install-man'"

install: all

install-man:
	make -C doc
	cp doc/man/man3/* $(PREFIX)/share/man/man3/

dist: distdir
	rm -f $(PACKAGE)-$(VERSION).tar.gz
	tar -cf $(PACKAGE)-$(VERSION).tar $(PACKAGE)-$(VERSION)
	gzip --best $(PACKAGE)-$(VERSION).tar
	rm -rf $(PACKAGE)-$(VERSION)

distdir:
	rm -rf $(PACKAGE)-$(VERSION)
	mkdir $(PACKAGE)-$(VERSION)
	cp README ChangeLog Makefile \
		generate.pl binreloc.m4 \
		basic.c glib.c normal.c \
		$(PACKAGE)-$(VERSION)/
	mkdir $(PACKAGE)-$(VERSION)/doc
	cp doc/{Makefile,Doxyfile,TUTORIAL,binreloc-intro.txt,glib-binreloc-intro.txt} \
		$(PACKAGE)-$(VERSION)/doc/
	mkdir $(PACKAGE)-$(VERSION)/tests
	cp tests/{Makefile,glib-test.c,normal-test.c,lib.c,lib.h} \
		$(PACKAGE)-$(VERSION)/tests/

clean:
	make -C tests clean
	make -C doc clean
