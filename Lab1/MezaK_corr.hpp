#ifndef MezaK_HeadrGaurd2
#define MezaK_HeadrGaurd2

#include <string>
#include <iostream>
#include <vector>

using std::vector;

namespace KXM{

    class Stats{
        
         public:
                    //setters
                    Stats(float, float);
                    
                    void findmin(vector<float> data);
                    void findmax(vector<float> data);
                    void findmean(vector<float> data);
                    void findstdev(vector<float> data);
                    void findhistogram(vector<float> data);
                
                    float getmin();
                    float getmax();
                    float getmean();
                    float getstdev();
                    vector<float> gethistogram();

                   
                    

           private:
                    //std::vector<float> data;
                    float min;
                    float max;
                    float mean;
                    float stdev;
                    vector<float> histogramdata{};
                   

    };
}

#endif