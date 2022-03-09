CC = g++

brennanb_corr.o: brennanb_corr.cpp brennanb_corr.o brennanb_stats.o
	 	 	 g++ -c $^
	 	 	 g++ -o Simple $^

brennanb_stats.o: brennanb_stats.cpp brennanb_stats.hpp
	 	 	 g++ -c $^

all: brennanb_corr.o brennanb_stats.o

clean: 
	 rm -f *.o
	 rm -f *.gch
	 rm -f all
