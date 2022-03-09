CC = g++

cpp: toss_a_coin.cpp valley_of_plenty.cpp wolf.cpp
toss_a_coin.o: toss_a_coin.cpp toss_a_coin.hpp valley_of_plenty.hpp
	g++ -c toss_a_coin $^

valley_of_plenty.o: valley_of_plenty.cpp valley_of_plenty.hpp valley_of_plenty.hpp
	g++ -c valley_of_plenty $^

wolf.o: wolf.cpp wolf.hpp valley_of_plenty.hpp
	g++ -c wolf $^

dandelion.o:  toss_a_coin.cpp valley_of_plenty.cpp wolf.cpp toss_a_coin.hpp valley_of_plenty.hpp wolf.hpp
	g++ -o /home/mezak/BioC2/Midterm2022/Straightforward $^

all: toss_a_coin.o valley_of_plenty.o wolf.o dandelion.o

clean: 
	 rm -f *.o
	 rm -f *.gch
