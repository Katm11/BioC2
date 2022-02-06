// reading a text file
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <iterator>
using namespace std;

std::vector<float> data;

int main () {
  string filename;
  ifstream myfile;
  string line;

  cout<<"which file do you want to open?";
  cin>>filename;

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

  return 0;
}