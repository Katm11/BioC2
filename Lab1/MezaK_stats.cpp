#include "MezaK_stats.hpp"
#include <iostream>
#include <vector>

//using namespace KXM;
using std::cout;
using std::endl;
std::vector<float> data{3.0,5.0,6.0,1.0,8.0,7.0};

float findmin(std::vector<float>);

KXM::Stats::Stats(){

        min = 0;
        max = 0;
        mean = 0;

}

int main(){

    KXM::Stats Testing;
    KXM::Stats Testing2;
    KXM::Stats Testing3; 

    float result = Testing.findmin(data);
    cout << "Min value is: " << result << endl;

    float result2 = Testing2.findmax(data);
    cout << "Max value is: " << result2 << endl;

    float result3 = Testing3.findmean(data);
    cout << "Mean value is: " << result3 <<endl;
}