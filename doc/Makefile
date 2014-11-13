.PHONY: clean

html/*: Makefile ../generate.pl ../basic.c ../normal.c ../glib.c
	../generate.pl normal normal.c normal.h
	../generate.pl glib   glib.c   glib.h
	cat binreloc-intro.txt normal.c normal.h > binreloc
	cat glib-binreloc-intro.txt glib.c glib.h > glib-binreloc
	rm -rf normal.c normal.h glib.c glib.h html man
	doxygen

clean:
	rm -rf html man binreloc glib-binreloc
