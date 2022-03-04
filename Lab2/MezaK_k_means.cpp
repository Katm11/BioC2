#include "MezaK_k_means.hpp"
#include "MezaK_vector_ops.hpp"
#include <iostream>
#include <fstream>
#include <vector>
#include <math.h>
#include <stdio.h>
#include <iterator>

using std::cout;
using std::endl;
using namespace std;
//std::vector<float> data{3.0,5.0,6.0,1.0,8.0,7.0};
//std::vector<float> data;


ifstream myfile1;
ifstream myfile2;


kMean::Cluster::Cluster(){

        this->objName;
        this->objMean;
        this->clusterSet;
}

void kMean::Cluster::setObjName(std::string dataName){

     this->objName = dataName;
    
}

std::string kMean::Cluster::getObjName(){

     this->objName;
    
}

void kMean::Cluster::setObjMean(float mean){

     this->objName = mean;
    
}

float kMean::Cluster::getObjMean(){

     this->objMean;
    
}

float kMean::Cluster::distance(float dataPt) {
    // initialize variables
    float clusterDist = 0.0;
    float mean = this->objMean;
    
    clusterDist = abs(dataPt - mean);

}


int main (int arc, char* argv[]) {

    float x,y,z;
    Lab2::Operations Testing(x,y,z);
    kMean::Cluster Test;
    float criteria;

    float line, distCluster1 = 0.0, distCluster2 = 0.0, distCluster3 = 0.0, criteria = 1.0, oldMean1 = 0.0, oldMean2 = 0.0, oldMean3 = 0.0, newMean1 = 0.0, newMean2 = 0.0, newMean3 = 0.0;
   
   //Make sure this exists next
    myfile1.open("log_ratio_input.dat");
   
    if (myfile1.is_open()) {
        
        cout << " log_ratio_input.dat exists " << endl;
    } 
    else {
        cout << "ERROR: log_ratio_input.dat does not exist. " << endl;
    
    std::istream_iterator<float> start1(myfile1), end1;
  std::vector<float> lrData(start1, end1);
  
  std::istream_iterator<float> start2(myfile2), end2;
  std::vector<float> data2(start2, end2);

    criteria = abs(oldMean1 - newMean1) + abs(oldMean2 - newMean2) + abs(oldMean3 - newMean3);

    // initialize three cluster classes, names, and means
    kMean::Cluster cluster1;
    kMean::Cluster cluster2;
    kMean::Cluster cluster3;

      // suppressed < 0, stationary = 0, expressed > 0
    cluster1.setObjName("Suppressed");
    cluster2.setObjName("Stationary");
    cluster3.setObjName("Expressed");

    cluster1.setObjMean(-0.5);
    cluster2.setObjMean(0.0);
    cluster3.setObjMean(0.5);

    // (4) while this criteria is greater than 0.0001, repeat 1-4
    while (criteria > 0.0001) {
        // remove all members
        cluster1.clusterSet.clear();
        cluster2.clusterSet.clear();
        cluster3.clusterSet.clear();

        //Gotta set up them variables
        float distCluster1 = 0.0, distCluster2 = 0.0, distCluster3 = 0.0;
        
        int supCount = 0, statCount = 0, expCount = 0;

        // (1) for each log ratio data point calculate the distance of the point to each of the three cluster means
         for(int i = 0; i < lrData.size(); i++){    
           
            distCluster1 = cluster1.distance(i);
            distCluster2 = cluster2.distance(i);
            distCluster3 = cluster3.distance(i);
            
            //compare returned distance to means and add point to closest cluster

            if (distCluster1 < distCluster2 && distCluster1 < distCluster3) {
               
                cluster1.clusterSet.push_back(lrData[i]);
            } 
            else if (distCluster2 < distCluster1 && distCluster2 < distCluster3) {
               
                cluster2.clusterSet.push_back(lrData[i]);
            }
            else if (distCluster3 < distCluster1 && distCluster3 < distCluster2) {
               
                cluster3.clusterSet.push_back(lrData[i]);
            }
            else{

                cout << "ERROR:Cluster set data error at: " << lrData[i] << endl;
            }
        }
  };

    oldMean1 = cluster1.getObjMean();
    oldMean2 = cluster2.getObjMean();
    oldMean3 = cluster3.getObjMean();

   // Test.setObjMean(cluster1.clusterSet);
    newMean1 = Test.getObjMean();

    //Test.setObjMean(cluster2.clusterSet);
    newMean2 = Test.getObjMean();
        
    //Test.setObjMean(cluster3.clusterSet);
    newMean3 = Test.getObjMean();

}