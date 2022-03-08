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

if [ ! $2 ]
then
    echo "No second input"
    exit 1
fi

if [ ! $3 ]
then
    echo "No third input"
    exit 1
fi

INPUT=owid-covid-data.csv
#sed -i '/^$/d' $INPUT
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

case "$2" in
  "Australia")
    start=$(echo "0") 
    country="Australia" 
    ;;
  "US")
    start=$(echo "772")
    country="US" 
    ;;
  *)
    echo "Country Data 1 Not found"
    exit 1
    ;;
esac

case "$3" in
  "Australia")
    start=$(echo "0")
    country="Australia" 
    ;;
  "US")
    start=$(echo "772")
    country="US" 
    ;;
  *)
    echo "Country Data 2 Not found"
    exit 1
    ;;
esac

dataSet=$1
#echo $dataSet
#$dataSet


average_function () {
    OPTIND=1
MONTHS=(blank Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)

  for ((i = $start ; "${date[index]:0:1}" == "${date[index+1]:0:1}" ; i++))
do
    sum=$(echo "$sum + ${new_cases_per_million[$i]}" | bc -l )
    echo $sum
    index=$((index + 1));
done

if [ "${date[index]:0:1}" != "${date[index+1]:0:1}" ]
then
    #sum=0
    index=$((index + 2));
fi

avg=$(echo "$sum / $index" | bc -l )
sum=0
month=${date[index-1]:0:1}
#echo $month
echo The average $1 for $country during ${MONTHS[month]} ${date[index-2]:5:7} is $avg

}

average_function "$1" "$2"

average_function "$1" "$3"
