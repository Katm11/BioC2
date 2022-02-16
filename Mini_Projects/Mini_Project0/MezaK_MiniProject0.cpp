#include "MezaK_MiniProject0.hpp"
using namespace std;
#include <unistd.h>

IllbeHack::TimeHacking::TimeHacking(std::string objectToHack){

    this->time_to_hack;
    this->objectToHack;
}

void IllbeHack::TimeHacking::setTimeToHack(int seconds){

    seconds = this->time_to_hack;
}

string IllbeHack::TimeHacking::setObjectToHack(string Object){

    return Object = this->objectToHack;
}

int IllbeHack::TimeHacking::getTimeToHack(){

   return this->time_to_hack;
}

string IllbeHack::TimeHacking::getObjectToHack(){

    return this->objectToHack;
}

void IllbeHack::TimeHacking::hackTime(){

    cout << "\n=============================" << endl;
    cout << "Hacking in Progress Stand By" << endl;
    cout << "=============================\n" << endl;
    sleep(this->time_to_hack);
    cout << "Time was Hacked for: " << this->time_to_hack << " Seconds" << endl;

 }
int main(int arc, char* argv[]){

    std::string Object;
    std::string reason;
    int time;

    cout<<"What Object do you want to hack? ";
    cin>>Object;

    //cout<<"\nWhy?? (Wrong answers only) ";
    //cin >> reason;

    cout<<"For how long (seconds) ?? ";
    cin >> time;

    IllbeHack::TimeHacking Hack(Object);

    Hack.setObjectToHack(Object);
    string result = Hack.getObjectToHack();
    cout << "You want to Hack: " << result << endl;
 
    Hack.setTimeToHack(time);
   // int sec = Hack.getTimeToHack();
    cout << "Hack time entered: " << time << " Seconds" << endl;
    
    Hack.hackTime();

    cout << "\n*Hacking Complete, Congrats*" <<endl;

}