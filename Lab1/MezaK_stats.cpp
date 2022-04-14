#include "MezaK_stats.hpp"
#include <iostream>
#include <vector>
#include <math.h>
#include <stdio.h>

//using namespace KXM;
using std::cout;
using std::endl;
//std::vector<float> data{3.0,5.0,6.0,1.0,8.0,7.0};
//std::vector<float> data;

//float findmin(std::vector<float>);

KXM::Stats::Stats(float min, float max){

        this->min;
        this->max;
        this->mean;
        this->sumval;
        this->stdev;
        std::vector<float> histogramdata{};

}

 void KXM::Stats::findmin(std::vector<float> data){

     int size = data.size();
     float minval = data[0];
     int i = 0;

     while(i < size){

         if(min > data[i]){

           this->min = data[i];
           minval = data[i];
         }
         i++;
     }
    // return min;
}

float KXM::Stats::getmin(){
    return this->min;
}

void KXM::Stats::findmax(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float maxval = data[0];

     while(i < size){

         if(max < data[i]){

            this->max = data[i];
            maxval = data[i];
         }
         i++;
     }
     //return max;
}

float KXM::Stats::getmax(){
    return this->max;
}

void KXM::Stats::findmean(std::vector<float> data){

     int size = data.size();
     float sum;

     for(int i = 0 ; i < size; i++){

           sum = sum + data[i];
     }
    this->sumval = sum;
    this->mean = sum/size;
    // return mean;
}

float KXM::Stats::getsum(){
    return this->sumval;
}

float KXM::Stats::getmean(){
    return this->mean;
}

void  KXM::Stats::findstdev(std::vector<float> data) {

    float size = data.size();
    float stdeval;

    for (int i = 0; i < size; i++) {           
        stdeval += pow(data[i] - this-> mean, 2);
    }
    stdeval = stdeval / (size -1 );                       

    stdeval = sqrt(stdeval);                         

    this->stdev = stdeval;                                    

}

float KXM::Stats::getstdev(){
    return this->stdev;
}

void  KXM::Stats::findhistogram(std::vector<float> data) {
    
    int size = data.size();

    double upper = 0;
    double lower = 0;
    float sampmean = 0, width = 0;
    width = 0.4 * (this->stdev);
    std::vector<float> histogramval{}; 

    
    int Index = 0;

        lower = this->mean - (3 * this->stdev);
        upper = this->mean + (3 * this->stdev);
 
    int numbuckets = (lower-upper)/width;
  
    int bin[numbuckets+1];

        for (int i = 0; i < size; i++) { 
         Index=0;
            if ((data[i] >= lower) && (data[i] < upper)) {    

                Index = (data[i]-lower)/width;
            }
            else if(data[i]>upper){
            
                Index = size;
            }
    ++bin[Index];
            }
          
        
    //for (int k = 0; k < 16; k++){
        //histogramval.insert(histogramdata.end(), 1, bin[k]);

        //histogramval.push_back(bin[k]);
   // }
    for(int i=0; i<16; ++i){

    cout << bin[i] << "\t| ";
    
    for(int j=0; j<bin[i] && j<size; ++j){
      
      cout << "*";
    }
    cout << endl;
  }
    //this->histogramdata = histogramval;
    }
    

std::vector<float> KXM::Stats::gethistogram(){

    return this->histogramdata;
}

// int main(){

// }