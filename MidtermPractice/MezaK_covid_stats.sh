#!/bin/bash
# date: 3/6/22
# this script downloads latest data on COVID from website and provides summary info to user
# 
INPUT=owid-covid-data.csv

OLDIFS=$IFS
IFS=','

#headers=={ head -n 1}
while IFS=',' read -ra data
#[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

do
        # display $line or do something with $line
	# ios_code=${data[0]}
    # continent=${data[1]}
    location+=("${data[2]}")		
    date+=("${data[3]}")		
    # total_cases=${data[4]}
    # new_cases=${data[5]}	
    # #new_cases_smoothed	
    # total_deaths=${data[7]}	
    # new_deaths=${data[8]}	
    # #new_deaths_smoothed	
    # total_cases_per_million=${data[10]}		
    new_cases_per_million+=("${data[11]}")	
    #new_cases_smoothed_per_million	
    #total_deaths_per_million	
    #new_deaths_per_million	
    # new_deaths_smoothed_per_million	
    # reproduction_rate	
    # icu_patients	
    # icu_patients_per_million	
    # hosp_patients	
    # hosp_patients_per_million	
    # weekly_icu_admissions	
    # weekly_icu_admissions_per_million	
    # weekly_hosp_admissions	
    # weekly_hosp_admissions_per_million	
    # new_tests	
    # total_tests	
    # total_tests_per_thousand	
    # new_tests_per_thousand	
    # new_tests_smoothed	
    # new_tests_smoothed_per_thousand	
    # positive_rate	
    # tests_per_case	
    # tests_units	
    # total_vaccinations	
    # people_vaccinated	
    # people_fully_vaccinated	
    # total_boosters	
    # new_vaccinations	
    # new_vaccinations_smoothed	
    # total_vaccinations_per_hundred	
    # people_vaccinated_per_hundred	
    # people_fully_vaccinated_per_hundred	
    # total_boosters_per_hundred	
    # new_vaccinations_smoothed_per_million	
    # new_people_vaccinated_smoothed	
    # new_people_vaccinated_smoothed_per_hundred	
    # stringency_index	
    # population	
    # population_density	
    # median_age	
    # aged_65_older	
    # aged_70_older	
    # gdp_per_capita	
    # extreme_poverty	
    # cardiovasc_death_rate	
    # diabetes_prevalence	
    # female_smokers	
    # male_smokers	
    # handwashing_facilities	
    # hospital_beds_per_thousand	
    # life_expectancy	
    # human_development_index	
    # excess_mortality_cumulative_absolute	
    # excess_mortality_cumulative	excess_mortality	
    # excess_mortality_cumulative_per_million
done < <(tail -n +2 $INPUT)
IFS=$OLDIFS

echo "${location[@]}" > countries.txt
echo "${new_cases_per_million[@]}" > newCasesPmil.txt
echo "${date[@]}" > dates.txt

#sort newCasesPmil.txt | uniq -d | wc -l
#sort dates.txt | uniq -d | wc -l
#sort countries.txt | uniq -d | wc -l

#sed -i "s/ /,/g" dates.txt

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
index=0
sum=0
avg=0
while ["${date[index]}" | sed "s/(.{1}).*/\1/" == "${date[index + 1 ]}" | sed "s/(.{1}).*/\1/" ]
do
    sum=$(echo "$sum + ${new_cases_per_million[$index]}" | bc -l )
    echo $sum
        index=$((index + 1));
done 
avg=$(echo "$sum / $index" | bc -l )
echo The average is $avg

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