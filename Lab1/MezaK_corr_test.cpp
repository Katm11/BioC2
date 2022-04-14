/*#include "MezaK_corr.hpp"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <iterator>

using namespace std;
//using namespace KXM;

std::vector<float> data1;
std::vector<float> data2;

std::string filename1;
std::string filename2;
ifstream myfile1;
ifstream myfile2;

int main(int arc, char* argv[]){

float m1,m2;
KXM1::Corr Test(m1,m2);

  cout<<"Input File 1: ";
  cin>>filename1;
  
  cout<<"Input File 2: ";
  cin>>filename2;
  
  myfile1.open(filename1);
  myfile2.open(filename2);

  if (myfile1.is_open()  && myfile2.is_open()){
    
  std::istream_iterator<float> start1(myfile1), end1;
  std::vector<float> data1(start1, end1);
  
  std::istream_iterator<float> start2(myfile2), end2;
  std::vector<float> data2(start2, end2);


   float corr;
  //float size = data.size();

   Test.findcorr(data1,data2); 
   corr = Test.getcorr();
    cout << "Corr value is: " << corr << endl;
  }
  else if(!myfile1){
     cout << "ERROR: Unable to open file 1" << endl;
  }
  else if(!myfile2){
    cout << "ERROR: Unable to open file 2" << endl;
  }
  else{
    cout << "ERROR: Unable to open both files" << endl;
  }
}
*/