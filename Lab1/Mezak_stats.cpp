#include "MezaK_stats.hpp"
#include <iostream>
#include <vector>

//using namespace KXM;

KXM::Stats::Stats(){

        min = 0;
        max = 0;

}

void KXM::Stats::minimum(std::vector<float> data){

    return this->min;
}

float getmin(){

    return this->min;
}
int main(){

    KXM::Stats Testing;
      
    std::vector<float> test{3.0,5.0,6.0,1.0,8.0,7.0};

      findmin(test);
}