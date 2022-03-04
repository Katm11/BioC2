/*
Name: Kat Meza
Assignment: Lab 2
Date: 2/22/22
Description: 
*/

#ifndef MezaK_HeadrGaurd
#define MezaK_HeadrGaurd

#include <string>
#include <iostream>
#include <vector>

using std::vector;

namespace Lab2{

    class Operations{

        
            public:
                    //setters
                    Operations(float, float, float);
                    
                    void findsum(vector<float> data);
                    void finddif(vector<float> data,vector<float> data1,float numGene);
                    void findquot(vector<float> data, float c);
                

                    float getsum();
                    float getmean();
                    vector<float> getdif();
                    vector<float> getquot();

    
           private:
                    //std::vector<float> data;
                    float sum;
                    float mean;
                    vector<float> difference;
                    vector<float> quotient;
    };

}

#endif