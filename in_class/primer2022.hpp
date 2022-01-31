/*
Name: Kat Meza
Assignment: 
Date: 1/31/22
Description: This code will act as a primer on class design and creation in C++
*/

#include <string>
#include <iostream>

//mySpace::yourSpace::myClass

namespace mySpace{
    namespace yourSpace{
    class myClass{

      public:
         myClass(std::string name, int init_num_students);
            myClass(std::string name);

         int get_num_students();
         std::string get_name();
         void set_num_students(int num);

      private:

         int num_students;
         std::string className;

};
}
}