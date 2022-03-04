#include "MezaK_vector_ops.hpp"
#include "MezaK_pre_processing.hpp"
#include "MezaK_k_means.hpp"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <iterator>
#include <math.h>
using namespace std;

std::vector<float> data;
std::vector<float> data2;
std::vector<float> data3;
std::vector<float> data4;
//void Statistics(std::vector<float> data);

std::string redFile;
ifstream myfile1;

std::string greenFile;
ifstream myfile2;

std::string RbackFile;
ifstream myfile3;

std::string GbackFile;
ifstream myfile4;

std::string newFile;
ifstream myfile5;

ofstream finalFile;

//ifstream myfile5;

int main (int arc, char* argv[]) {
   //std::string redFile;
  float x,y,z;
  float numGene;
  Lab2::Operations Testing(x,y,z);
  
 cout<<"Which Red File would you like to open? ";
  cin>>redFile;
  
  cout<<"Which Green File would you like to open? ";
  cin>>greenFile;

  cout<<"What is the background file? ";
  cin>>RbackFile;

  cout<<"What is the background file? ";
  cin>>GbackFile;

  cout<<"What file would you like to write the calibrated data to? ";
  cin>>newFile;

  cout<<"How many genes will be analyzed? ";
  cin>>numGene;
  
  myfile1.open(redFile);
  myfile2.open(RbackFile);
  myfile3.open(greenFile);
  myfile4.open(GbackFile);
  

  if ((myfile1.is_open())  && (myfile2.is_open()) && (myfile3.is_open()) && (myfile3.is_open()) && (myfile3.is_open())){
    
  std::istream_iterator<float> start1(myfile1), end1;
  std::vector<float> data1(start1, end1);
  
  std::istream_iterator<float> start2(myfile2), end2;
  std::vector<float> data2(start2, end2);

  std::istream_iterator<float> start3(myfile3), end3;
  std::vector<float> data3(start3, end3);

  std::istream_iterator<float> start4(myfile4), end4;
  std::vector<float> data4(start4, end4);

  std::istream_iterator<float> start5(myfile5), end5;
  std::vector<float> data5(start5, end5);

  if((numGene > data1.size()) || (numGene > data2.size()) || (numGene > data3.size()) || (numGene > data4.size())){

      cout << "ERROR: number of genes requested exceeds the number of data points in the file" << endl;
  };

   //std::vector<float> newRed;
   //std::vector<float> newGreen;
  //float size = data.size();

   Testing.finddif(data1,data2,numGene); 
   std::vector<float> newRed = Testing.getdif();

   Testing.finddif(data3,data4,numGene); 
   std::vector<float> newGreen = Testing.getdif();
   
   Testing.findsum(newRed); 
   float newRmean = Testing.getmean();

   Testing.findsum(newGreen); 
   float newGmean = Testing.getmean();

   Testing.findquot(newRed,newRmean); 
   std::vector<float> Rnormalized = Testing.getquot();

   Testing.findquot(newGreen, newGmean); 
   std::vector<float> Gnormalized = Testing.getquot();

    //myfile5.open("log_ratio_input.dat");
   
   std::vector<float> logIntensity;

   for (int i = 0; i < newRed.size(); i++) {
        
        logIntensity[i] = log10(Rnormalized[i] / Gnormalized[i]);

    }
    
  finalFile.open(newFile);

    if (finalFile.is_open()) {
            
            cout << " log_ratio_input.dat exists " << endl;
            
            for (int i = 0; i < logIntensity.size(); i++) {
        
                finalFile << logIntensity[i] << endl;

            }

          finalFile.close();
        } 
    else {
            cout << "ERROR: New Data File not made. " << endl;
        }
    
    

  }
  else if(!myfile1){
     cout << "ERROR: Unable to open red file" << endl;
  }
  else if(!myfile2){
    cout << "ERROR: Unable to open green file" << endl;
  }
  else if(!myfile3){
    cout << "ERROR: Unable to open background file" << endl;
  }
  else{
    cout << "ERROR: Unable to open all files" << endl;
  }

  
}