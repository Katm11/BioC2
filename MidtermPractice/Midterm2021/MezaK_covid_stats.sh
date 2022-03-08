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


dataSet=$1
#echo $dataSet
#$dataSet


average_function () {
    #OPTIND=1
    local a=$1
	  local b=$2
    sum=0
    avg=0

    case "$2" in
  "Australia")
    start=$(echo "1") 
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

MONTHS=(blank Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
for i in "${location[@]}"
do
if [ ${new_cases_per_million[$index]} ]
then

for ((index = $start ; "${date[index-1]:0:1}" == "${date[index]:0:1}" ; index++))
do
    sum=$(echo "$sum + ${new_cases_per_million[$index]}" | bc -l )
    #echo ${new_cases_per_million[$index]}
done    
if [[ "${date[index-1]:0:1}" != "${date[index]:0:1}" ]]; then
    avg=$(echo "$sum / $index" | bc -l )
sum=0
month=${date[index-1]:0:1}
#echo $month
echo The average $1 for $country during ${MONTHS[month]} ${date[index-2]:5:7} is $avg
index=$((index + 2));
continue
  #fi
    fi


fi
done
}

average_function $1 $2 >>"$2_$3_covid_comparision.txt"

average_function $1 $3 >>"$2_$3_covid_comparision.txt"
