
#Name: Kat Meza
#Date:2/25/21
#Assignment: Lab 2
#Comments: 


CC = g++

vector_ops.o: MezaK_vector_ops.hpp MezaK_vector_ops.cpp
			  g++ -c vector_ops $^

stats1.o: MezaK.hpp MezaK_stats.cpp MezaK_stats_test.cpp 
			  g++ -c cppstats $^

preproc.o: MezaK_pre_processing.cpp MezaK_pre_processing.hpp MezaK_stats.hpp MezaK_stats.cpp kinnisone_vector_ops.hpp MezaK_vector_ops.cpp
			  g++ -o preprocess $^

cluster.o: MezaK_k_means.hpp MezaK_k_means.cpp MezaK_stats.hpp MezaK_stats.cpp MezaK_pre_processing.hpp MezaK_pre_processing.cpp MezaK_vector_ops.hpp MezaK_vector_ops.cpp
			  g++ -o cluster $^

all: vector_ops.o lab1_stats.o preprocess.o cluster.o

clean:
		rm -f *.o 
		rm -f *.gch
		rm -f all