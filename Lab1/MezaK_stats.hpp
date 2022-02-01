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
                    
                    void minimum(vector<float>);
                    void maximum(vector<float>);
                    void mean(vector<float>);
                    void stdev(vector<float>);
                    vector<float> histogram(vector<float>);
                
            private:
                    float min;
                    float max;
                    float mean;
    };

}


 void KXM::Stats::minimum(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float min = data[0];

     while(i < size){

         if(min < data[i]){

            this->min = data[i];
         }
         i++;
     }
     //return min;
}

void KXM::Stats::maximum(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float max = data[0];

     while(i < size){

         if(max > data[i]){

            this->max = data[i];
         }
         i++;
     }
     //return max;
}

#endif