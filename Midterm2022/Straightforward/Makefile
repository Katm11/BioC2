CC = g++

dandelion.o: dandelion.cpp dandelion.o toss_a_coin.o valley_of_plenty.o wolf.o
	 	 	 g++ -c $^
	 	 	 g++ -o Straightforward $^

toss_a_coin.o: toss_a_coin.cpp toss_a_coin.hpp
	 	 	 g++ -c $^

valley_of_plenty.o: valley_of_plenty.cpp valley_of_plenty.hpp
	 	 	 g++ -c $^

wolf.o: wolf.cpp wolf.hpp
	 	 	 g++ -c $^

all: dandelion.o toss_a_coin.o valley_of_plenty.o wolf.o

clean: 
	 rm -f *.o
	 rm -f *.gch
	 rm -f all
