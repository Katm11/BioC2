#include "MezaK_stats.hpp"
#include <iostream>
#include <vector>

//using namespace KXM;
using std::cout;
using std::endl;
std::vector<float> data{3.0,5.0,6.0,1.0,8.0,7.0};


//float findmin(std::vector<float>);

KXM::Stats::Stats(){

        min = 0;
        max = 0;
        mean = 0;

}

 float KXM::Stats::findmin(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float min = data[0];

     while(i < size){

         if(min > data[i]){

            min = data[i];
         }
         i++;
     }
     return min;
}

float KXM::Stats::findmax(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float max = data[0];

     while(i < size){

         if(max < data[i]){

            max = data[i];
         }
         i++;
     }
     return max;
}

float KXM::Stats::findmean(std::vector<float> data){

     int size = data.size();
     int i = 0;
     float sum = 0;
     float mean = 0;

     while(i < size){

            sum = sum + data[i];
         
         i++;
        
     }
     mean = sum/size;
     return mean;
}

float KXM::Stats::PrintStats(std::vector<float> data){

    KXM::Stats Testing;
     KXM::Stats Testing2;
     KXM::Stats Testing3; 

     float result = Testing.findmin(data);
     cout << "Min value is: " << result << endl;

     float result2 = Testing2.findmax(data);
     cout << "Max value is: " << result2 << endl;

     float result3 = Testing3.findmean(data);
     cout << "Mean value is: " << result3 <<endl;

     return 0;
 }

 int main(){
     
     KXM::Stats Print;

    Print.PrintStats(data);
 }