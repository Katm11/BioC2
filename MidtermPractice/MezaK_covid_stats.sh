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

sum=0
avg=0
#"${myarr[0]:7:3}" i = 0 ; i <= 1000 ; i++


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
