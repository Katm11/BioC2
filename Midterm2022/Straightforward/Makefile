CC = g++

dandelion: dandelion dandelion.cpp dandelion.o toss_a_coin.cpp .gch valley_of_plenty.cpp .gch wolf.cpp dandelion dandelion.o toss_a_coin.hpp toss_a_coin.hpp.gch valley_of_plenty.hpp valley_of_plenty.hpp.gch wolf.hpp
	 	 	 g++ -c $^
	 	 	 g++ -o dandeli $^

dandelion.o: dandelion.cpp toss_a_coin.hpp valley_of_plenty.hpp
	 	 	 g++ -c dandelion $^

dandelion.o: dandelion.o  
	 	 	 g++ -c dandelion $^

toss_a_coin.o: toss_a_coin.cpp toss_a_coin.hpp valley_of_plenty.hpp
	 	 	 g++ -c toss_a_coin $^

.gch: .gch  
	 	 	 g++ -c .g $^

valley_of_plenty.o: valley_of_plenty.cpp valley_of_plenty.hpp 
	 	 	 g++ -c valley_of_plenty $^

.gch: .gch  
	 	 	 g++ -c .g $^

wolf.o: wolf.cpp wolf.hpp 
	 	 	 g++ -c wolf $^

all: dandelion dandelion.o dandelion.o toss_a_coin.o .gch valley_of_plenty.o .gch wolf.o

clean: 
	 rm -f *.o
	 rm -f *.gch
	 rm -f all
