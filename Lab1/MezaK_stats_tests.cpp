// reading a text file
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <iterator>
using namespace std;

std::vector<float> data;
std::string filename;

void readFile(std::string filename){

//std::string filename;
  ifstream myfile;
  string line;

    myfile.open(filename);

  if (myfile.is_open())
  {
    
    std::istream_iterator<float> start(myfile), end;
    std::vector<float> data(start, end);
   
    cout << "Vector elements are: ";
    for (int i = 0; i < data.size(); ++i) {
        cout << data[i] << endl;
    }

    myfile.close();
  }

  else cout << "Unable to open file"; 

}

int main () {
   //std::string filename;
  cout<<"Which file do you want to open? ";
  cin>>filename;
  readFile(filename);

}