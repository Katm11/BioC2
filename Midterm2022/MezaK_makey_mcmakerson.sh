#!/bin/bash
#Kat Meza
# date: 3/8/22
# Description: Automatically generate a makefile for an arbitrary code project
#

echo "Passed arguments: "
echo $@
echo "Total number of arguments: "
echo $#

#only one argument: a path to a directory with code files inside

if [ -f "$1" ]                
then
    echo "File Path Found"
else
    echo "ERROR: File Path not found"   #gotta love error checking
fi