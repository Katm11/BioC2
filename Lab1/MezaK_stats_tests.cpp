
#include "MezaK_stats.hpp"
#include "MezaK_stats.cpp"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <iterator>
using namespace std;
using namespace KXM;

std::vector<float> data;
//void Statistics(std::vector<float> data);

std::string filename;
ifstream myfile;
    

int main (int arc, char* argv[]) {
   //std::string filename;
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

   Testing.findmax(data); 
   max = Testing.getmax();
    cout << "Max value is: " << max << endl;

   Testing.findmean(data); 
   mean = Testing.getmin();
    cout << "Mean value is: " << mean << endl;

  Testing.findstdev(data); 
   stdev = Testing.getstdev();
    cout << "Standard Dev value is: " << stdev << endl;

   //Testing.findhistogram(data); 
  // histogram = Testing.gethistogram();
  // cout << "Histogram value is: \n" << histogram << endl;

  }
  else cout << "Unable to open file"; 
myfile.close();

}