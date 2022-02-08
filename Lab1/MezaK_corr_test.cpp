#include "Mezak_corr.hpp"
#include"MezaK_stats.cpp"
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

std::string filename;
ifstream myfile;

int main(){

float m1,m2;
  KXM::Stats Testing(m1,m2);
  cout<<"Which file do you want to open? ";
  cin>>filename;
  
  myfile.open(filename);

  if (myfile.is_open()){
    
    std::istream_iterator<float> start(myfile), end;
    std::vector<float> data(start, end);
  
   float min,max,mean,stdev;
   vector<float> histogram;
    float size = data.size();

   Testing.findmin(data); 
   min = Testing.getmin();
    cout << "Min value is: " << min << endl;

  else cout << "Unable to open file"; 
}