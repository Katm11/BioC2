#!/bin/bash


#Name: Kat Meza
#Assignment: In Class 2/16
#Date: 2/16/22
#Description: Bash Conditionals

Line1="Oh-oh-oh-oh-oh,oh-oh-oh-oh,oh-oh-oh"
Line2="Caught in a bad romance"
Line3="Ra-ra-ah-ah-ah"
Line4="Roma Roma-ma"
Line5="Gaga, Ooh la-la"
Line6="Want your bad romance"

for(( i=0;i<13;i++ ))
 do
    if [ $i -eq 1 ] || [ $i -eq 3 ];
     then
        echo $Line1
    fi
     if [ $i = 2 ] || [ $i = 4 ];
     then
        echo $Line2
    fi
     if [ $i = 5 ] || [ $i = 9 ]; 
     then
        echo $Line3
    fi
     if [ $i = 6 ] || [ $i = 10 ]; 
     then
        echo $Line4
    fi
     if [ $i = 7 ] || [ $i = 11 ]; 
     then
        echo $Line5
    fi
     if [ $i = 8 ] || [ $i = 12 ]; 
     then
        echo $Line6
    fi
     if [ $i = 13 ] || [ $i = 23 ] || [ $i = 28 ] || [ $i = 37 ] || [ $i = 42 ] || [ $i = 23 ]; 
     then
        echo $Line6
    fi
done