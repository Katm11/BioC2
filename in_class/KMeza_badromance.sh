#!/bin/bash


#Name: Kat Meza
#Assignment: In Class 2/16
#Date: 2/16/22
#Description: Bash Conditionals

Line1="Oh-oh-oh-oh-oh,oh-oh-oh-oh,oh-oh-oh"
Line2="Caught in a bad romance"
Line3="Ra-ra-ah-ah-ah"
Line4="Roma, Roma-ma"
Line5="Gaga, Ooh la-la"
Line6="Want your bad romance"
Line7="I want your ugly, I want your disease\nI want your everything as long as it’s free"
Line8="I want your love"
Line9="Love, love, love, I want your love, oh, ey"
Line10="I want your drama, the touch of your hand (Hey!)\nI want your leather-studded kiss in the sand"
Line11="You know that I want you\nAnd you know that I need you\nI want it bad\nYour bad romance"


for(( i=0;i<111;i++ ))
 do
    if [ $i -eq 1 ] || [ $i -eq 3 ] || [ $i = 33 ] || [ $i = 35 ] || [ $i = 62 ] || [ $i = 64 ] || [ $i = 99 ] || [ $i = 102 ];
     then
        echo $Line1
    fi
     if [ $i = 2 ] || [ $i = 4 ] || [ $i = 34 ] || [ $i = 36 ] || [ $i = 63 ] || [ $i = 65 ] || [ $i = 101 ] || [ $i = 104 ];
     then
        echo $Line2
    fi
     if [ $i = 5 ] || [ $i = 9 ] || [ $i = 38 ] || [ $i = 67 ] || [ $i = 71 ] || [ $i = 106 ]; 
     then
        echo $Line3
    fi
     if [ $i = 6 ] || [ $i = 10 ] || [ $i = 107 ]; 
     then
        echo $Line4
    fi
     if [ $i = 7 ] || [ $i = 11 ] || [ $i = 40 ] || [ $i = 69 ] || [ $i = 73 ] || [ $i = 108 ]; 
     then
        echo $Line5
    fi
     if [ $i = 8 ] || [ $i = 12 ] || [ $i = 41 ] || [ $i = 70 ] || [ $i = 74 ] || [ $i = 92 ] || [ $i = 100 ] || [ $i = 103 ] || [ $i = 109 ];
     then
        echo $Line6
    fi
     if [ $i = 13 ] || [ $i = 23 ] || [ $i = 28 ] || [ $i = 37 ] || [ $i = 42 ] || [ $i = 52 ] || [ $i = 57 ] || [ $i = 66 ] || [ $i = 75 ] || [ $i = 84 ] || [ $i = 94 ] || [ $i = 105 ] || [ $i = 110 ]; 
     then
        echo -e
    fi
    if [ $i = 14 ]; 
     then
        echo -e $Line7
    fi
    if [ $i = 16 ] || [ $i = 20 ] || [ $i = 45 ] || [ $i = 49 ]; 
     then
        echo $Line8
    fi
    if [ $i = 17 ] || [ $i = 21 ] || [ $i = 22 ] || [ $i = 46 ] || [ $i = 50 ] || [ $i = 51 ]; 
     then
        echo $Line9
    fi
    if [ $i = 18 ]; 
     then
        echo -e $Line10
    fi
    if [ $i = 24 ] || [ $i = 53 ]; 
     then
        echo -e $Line11
    fi
done