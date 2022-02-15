#include "MezaK_stats.hpp"
#include "MezaK_corr.hpp"
#include <iostream>
#include <vector>
#include <math.h>
#include <stdio.h>

//using namespace KXM;
using std::cout;
using std::endl;

KXM1::Corr::Corr(float,float){

        this->corr;
        this->var;
        this->mean;

}

void  KXM1::Corr::findvar(std::vector<float> data) {

    float size = data.size();
    float variance;

    for (int i = 0; i < size; i++) {           
        variance += pow(data[i] - this-> mean, 2);
    }
    variance = variance / (size -1 );                                         

    this->var = variance;                                    

}

float KXM1::Corr::getvar(){
    return this->var;
}

void KXM1::Corr::findmean(std::vector<float> data){

     float size = data.size();
     float sum;

     for(int i = 0 ; i < size; i++){

           sum = sum + data[i];
     }
   
    this->mean = sum/size;
    // return mean;
}

float KXM1::Corr::getmean(){
    return this->mean;
}
void KXM1::Corr::findcorr(vector<float> data1,vector<float> data2)
{
  float m1,m2;
  KXM1::Corr Testing(m1,m2);

  float size1 = data1.size();
  float size2 = data2.size();

  float meanX,meanY,varX,varY;

   Testing.findmean(data1); 
   meanX = Testing.getmean();

   Testing.findmean(data2); 
   meanY= Testing.getmean();

   Testing.findvar(data1); 
   varX = Testing.getvar();

   Testing.findmean(data2); 
   varY = Testing.getvar();

  float corrval;

  for (int i=0; i<size1; ++i){
    corrval += ((data1[i] - meanX)*(data2[i] - meanY));
  }
  this -> corr = (corrval / sqrt(varX*varY));
}
  
float KXM1::Corr::getcorr(){
    return this->corr;
}