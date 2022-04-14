# Makefile for miniproject1 calculating swallow speeds 

CC = g++
SHELL = /bin/bash
CFLAGS = -fPIC -g
# finds stats library with linker flags
LDFLAGS = -L"/home/mezak/BioC2/Lab1"
# library directory 
LIBDIR = "/home/mezak/BioC2/Lab1"
# where the header file is 
INCDIR = -I"/home/mezak/BioC2/Lab1"

# need to call stats library

libstats.so:
	cd /home/mezak/BioC2/Lab1 && make libstats.so
	
airspeed: MezaK_MiniProject1.cpp
	make libstats.so
	$(CC) $(CFLAGS) $(INCDIR) -o $@ $^ -Wl,-rpath=$(LIBDIR) $(LDFLAGS)

clean: 
	rm -f *.o
	rm -f *.gch
	rm airspeed