/*
Name: Kat Meza
Assignment: Lab 0 Part 4
Date: 1/25/22
Description: Random Numbers
*/ 

#include <stdio.h>
#include <stdlib.h>

FILE *fp;
int sum = 0;
int NumArray[20];

int main(int argc, char *argv[]){

    fp = fopen("RandomNum.txt","r");

    for(int i = 0; i < 21; i++){

        fscanf(fp,"%d\n\r",&NumArray[i]);
        sum = sum + NumArray[i] ;
    }

    printf("The sum of all numbers: %d\n",sum);
}