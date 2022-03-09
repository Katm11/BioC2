CC = g++

dandelion.o: dandelion.cpp toss_a_coin.cpp valley_of_plenty.cpp wolf.cpp toss_a_coin.hpp valley_of_plenty.hpp wolf.hpp dandelion.o toss_a_coin.o valley_of_plenty.o wolf.o
	 	 	 g++ -c dandelion $^
	 	 	 g++ -o $@ $^

toss_a_coin.o: toss_a_coin.cpp toss_a_coin.hpp
	 	 	 g++ -c toss_a_coin $^

valley_of_plenty.o: valley_of_plenty.cpp valley_of_plenty.hpp
	 	 	 g++ -c valley_of_plenty $^

wolf.o: wolf.cpp wolf.hpp
	 	 	 g++ -c wolf $^

all: dandelion.o toss_a_coin.o valley_of_plenty.o wolf.o

clean: 
	 rm -f *.o
	 rm -f *.gch
	 rm -f all
