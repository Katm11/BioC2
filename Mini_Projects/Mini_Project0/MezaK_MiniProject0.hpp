/*
Name: Kat Meza
Assignment: Mini Project 0 
Date: 2/01/22
Description: Mini Project 0 will teach us how to hack time...
*/

#ifndef MezaK_HeadrGaurd
#define MezaK_HeadrGaurd

#include <string>
#include <iostream>
#include <unistd.h>
#include <vector>

using namespace std;

namespace IllbeHack{

    class TimeHacking{

        
            public:
                    //setters
                    TimeHacking(std::string objectToHack);
                   
                    int setTimeToHack(int seconds);
                    string setObjectToHack(string object);
                    int getTimeToHack();
                    string getObjectToHack();
                    void hackTime();
           private:
                    //std::vector<float> data;
                    int time_to_hack;
                    std::string objectToHack;
                   
    };

}

#endif