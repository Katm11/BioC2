#include "MezaK_vector_ops.hpp"
#include <iostream>
#include <vector>
#include <math.h>
#include <stdio.h>

using std::cout;
using std::endl;
using namespace std;
//std::vector<float> data{3.0,5.0,6.0,1.0,8.0,7.0};
//std::vector<float> data;


Lab2::Operations::Operations(float x, float y,float z){

        this->sum;
        this->difference;
        this->quotient;
        this->mean;

}

void Lab2::Operations::findsum(std::vector<float> data){

     int size = data.size();
     float sumval;

     for(int i = 0 ; i < size; i++){

           sumval = sumval + data[i];
     }
    this->sum = sumval;
    this->mean = sum/size;
    
}

float Lab2::Operations::getsum(){
    return this->sum;
}
float Lab2::Operations::getmean(){
    return this->mean;
}

void Lab2::Operations::finddif(std::vector<float> data,std::vector<float> data1, float numGene){

     int size = data.size();
     vector<float> difval;

     for(int i = 0 ; i < numGene; i++){

           difval[i] = data[i] - data1[i];
     }
    this->difference = difval;
    //this->mean = sum/size;
    
}

std::vector<float> Lab2::Operations::getdif(){
    return this->difference;
}

void Lab2::Operations::findquot(std::vector<float> data, float c){

     int size = data.size();
     vector<float> quotval;

     for(int i = 0 ; i < size; i++){

           quotval[i] = (quotval[i]/c);
     }
    this->quotient = quotval;
    
}

std::vector<float> Lab2::Operations::getquot(){
    return this->quotient;
}

