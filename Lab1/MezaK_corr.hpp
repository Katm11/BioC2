#include "MezaK_stats.hpp"
#ifndef MezaK_HeadrGaurd2
#define MezaK_HeadrGaurd2

#include <string>
#include <iostream>
#include <vector>

using std::vector;

namespace KXM1{

    class Corr{
        
         public:
                    //setters
                    Corr(float, float);
                    
                    void findcorr(vector<float> data1,vector<float> data2);
                    void findmean(vector<float> data);
                    void findvar(vector<float> data);
                
                    float getcorr();
                    float getmean();
                    float getvar();
           private:
                    //std::vector<float> data;
                    float corr;
                    float var;
                    float mean;
                   

    };
}

#endif