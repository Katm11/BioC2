#!/bin/bash
# date: 3/6/22
# this script downloads latest data on COVID from website and provides summary info to user
# 

if [ ! -f "owid-covid-data.csv" ]                   #set up all the variables in int form instead of string
then
    wget https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv -c owid-covid-data.csv
fi

if [ ! $1 ]
then
    echo "No first input"
    exit 1
fi

# if [ ! $2 ]
# then
#     echo "No second input"
#     exit 1
# fi

INPUT=owid-covid-data.csv

OLDIFS=$IFS
IFS=','

while IFS=',' read -ra data
#[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

do
    location+=("${data[2]}")		
    date+=("${data[3]}")				
    new_cases_per_million+=("${data[11]}")	
  
done < <(tail -n +2 $INPUT)
IFS=$OLDIFS

echo "${location[@]}" > countries.txt
echo "${new_cases_per_million[@]}" > newCasesPmil.txt
echo "${date[@]}" > dates.txt

#headers=={ head -n 1}
# OLDIFS=$IFS
# IFS=',/'
# while IFS='/,' read -ra dates
# #[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
# do
#         # display $line or do something with $line
#      month+=("${dates[0]}")
#       day+=("${dates[1]}")
#       year+=("${dates[2]}")

# done < dates.txt
# IFS=$OLDIFS

# echo "${year[@]}" > year.txt
# echo "${month[@]}" > month.txt
# echo "${day[@]}" > day.txt
#echo $date[@] "+%m"
#echo dates[@] | sed -r 's/(.{1}).*/\1/'
#echo dates[@] | sed -r 's//.*//'
#index=0
sum=0
avg=0
#"${myarr[0]:7:3}" i = 0 ; i <= 1000 ; i++

# read -p "Please enter the reference country name: " refCountry 
# case $refCountry in  
#   Australia) start=$(echo "0") ;;
#   US) start=$(echo "772") ;;
#   *) echo "Country not found" ;; 
# esac

case "$1" in
  "Australia")
    start=$(echo "0") ;;
  "US")
    start=$(echo "772") ;;
  *)
    echo "Country Data Not found"
    exit 1
    ;;
esac
MONTHS=(blank Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
for ((index = $start ; "${date[index]:0:1}" == "${date[index+1]:0:1}" ; index++))
do
    sum=$(echo "$sum + ${new_cases_per_million[$index]}" | bc -l )
    echo $sum
    #index=$((index + 1));
done 
avg=$(echo "$sum / $index" | bc -l )
month=${date[index-2]:0:1}
echo The average for $1 during ${MONTHS[month]} ${date[index-2]:5:7} is $avg



#echo ${MONTHS[month]}
#check for the user input
# totalCases=0
# for i in "${date[@]}"; do :
#     let index++
#     totalCases=$("$totalCases + $new_cases_per_million[$index]" | bc -l)
# done
# avgtotalCases=$(echo "$totalCases / $index" | bc -l)

# echo $avgtotalCases
# echo "Please enter the header name for the data you'd like to examine"
# read dataSet

# #error check
# while [ ! $dataSet == "iso_code" ] && [ ! $dataSet == "continent" ] && [ ! $dataSet == "location" ] && [ ! $dataSet == "date" ] && [ ! $dataSet == "total_cases" ] && [ ! $dataSet == "new_cases" ] && [ ! $dataSet == " total_deaths" ] && [ ! $dataSet == "new_deaths" ] && [ ! $dataSet == "total_cases_per_million" ] && [ ! $dataSet == "new_cases_per_million" ];
# do
#     echo "ERROR: Data set not found"               
#     echo "Please enter a different data set header to try again"
#     read dataSet
# done  

# echo "Please enter the reference country name"
# read refCountry

# echo "Please enter the header name for the name of a comparison country"
# read compCountry