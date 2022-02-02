
#include "primer2022.hpp"

mySpace::yourSpace::myClass::myClass(std::string name, int init_num_students){

    this->className = name;
    this->num_students = init_num_students;
}

int mySpace::yourSpace::myClass::get_num_students(){

    return this->num_students;
}