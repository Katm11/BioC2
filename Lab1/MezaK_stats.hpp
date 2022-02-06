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


 float KXM::Stats::findmin(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float min = data[0];

     while(i < size){

         if(min > data[i]){

            min = data[i];
         }
         i++;
     }
     return min;
}

float KXM::Stats::findmax(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float max = data[0];

     while(i < size){

         if(max < data[i]){

            max = data[i];
         }
         i++;
     }
     return max;
}

float KXM::Stats::findmean(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float sum = 0;
     float mean = 0;

     while(i < size){

            sum = sum + data[i];
         
         i++;
        
     }
     mean = sum/size;
     return mean;
}

#endif