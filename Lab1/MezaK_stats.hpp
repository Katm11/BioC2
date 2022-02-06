/*
Name: Kat Meza
Assignment: Lab 1 
Date: 2/01/22
Description: simple statistical routines in C++ that will be compiled and 
stored in your own library
*/

#ifndef MezaK_HeadrGaurd
#define MezaK_HeadrGaurd

#include <string>
#include <iostream>
#include <vector>

using std::vector;

namespace KXM{

    class Stats{

        
            public:
                    //setters
                    Stats();
                    float PrintStats(vector<float> data);
                    
                    float findmin(vector<float> data);
                    float findmax(vector<float> data);
                    float findmean(vector<float> data);
                    float findstdev(vector<float>);
                    vector<float> histogram(vector<float>);
                
            private:
                    std::vector<float> data;
                    float min;
                    float max;
                    float mean;
    };

}

#endif