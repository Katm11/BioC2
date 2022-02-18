#include "MezaK_MiniProject0.hpp"
using namespace std;
#include <unistd.h>

IllbeHack::TimeHacking::TimeHacking(std::string objectToHack){

    this->time_to_hack;
    this->objectToHack;
}

int IllbeHack::TimeHacking::setTimeToHack(int seconds){

    return this->time_to_hack = seconds;
}

string IllbeHack::TimeHacking::setObjectToHack(string Object){

   return this->objectToHack = Object;
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
    int seconds;

    cout<<"What Object do you want to hack? ";
    cin>>Object;

    //cout<<"\nWhy?? (Wrong answers only) ";
    //cin >> reason;

    cout<<"For how long (seconds) ?? ";
    cin >> seconds;

    string temp;
    IllbeHack::TimeHacking Hack(temp);

    Hack.setObjectToHack(Object);
    string result = Hack.getObjectToHack();
    cout << "\nYou are Hacking: " << result << endl;
 
    Hack.setTimeToHack(seconds);
   int time = Hack.getTimeToHack();
    cout << "Hack time entered: " << time << " Seconds" << endl;
    
    Hack.hackTime();

    cout << "\n*Hacking Complete, Congrats*" <<endl;

}