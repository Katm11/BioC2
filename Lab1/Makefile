# Makefile for lab 1 stats library

CC = g++ 
SHELL = /bin/bash
CFLAGS = -fPIC

#gcc *.c -c -fPIC

MezaK_stats.o: MezaK_stats.cpp MezaK_stats.hpp
	$(CC) *.cpp -c -fPIC

libstats.so: MezaK_stats.o
	$(CC) *.o -shared -o $@

all: libstats.so

clean:
	rm -f *.o
	rm -f *.gch