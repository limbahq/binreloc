CC=gcc
CFLAGS=-Wall -g
CFLAGS+=-DENABLE_BINRELOC

.PHONY: all

all: normal-test glib-test

normal-test: normal-test.c ../generate.pl ../*.c libshared.so
	../generate.pl normal normal-binreloc.c normal-binreloc.h
	$(CC) $(CFLAGS) normal-test.c normal-binreloc.c -o normal-test -L. -Wl,-rpath,$${ORIGIN} -lshared

glib-test: glib-test.c ../generate.pl ../*.c libshared.so
	../generate.pl glib glib-binreloc.c glib-binreloc.h
	$(CC) $(CFLAGS) glib-test.c glib-binreloc.c -o glib-test `pkg-config --cflags --libs glib-2.0` -L. -Wl,-rpath,$${ORIGIN} -lshared

libshared.so: lib.c ../generate.pl ../*.c
	../generate.pl normal lib-binreloc.c lib-binreloc.h
	$(CC) -fPIC $(CFLAGS) lib.c lib-binreloc.c -shared -o libshared.so

clean:
	rm -f *-binreloc.* normal-test glib-test libshared.so
