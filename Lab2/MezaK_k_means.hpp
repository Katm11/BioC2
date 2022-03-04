/*
Name: Kat Meza
Assignment: Lab 2
Date: 2/22/22
Description: 
*/

#ifndef MezaK_KGaurd
#define MezaK_KGaurd

#include <string>
#include <iostream>
#include <vector>

using std::vector;

namespace kMean{

    class Cluster{

        
            public:
                    //setters
                    Cluster();  // constructor

                    float distance(float dataPt);
                    vector<float> clusterSet;
                    
                    // setters
                    void setObjName(std::string name);
                    void setObjMean(float mean);
                    
                    // getters
                    std::string getObjName();
                    float getObjMean();

                    private:
                    // class variables
                    std::string objName;
                    float objMean;
                
    };

}

#endif