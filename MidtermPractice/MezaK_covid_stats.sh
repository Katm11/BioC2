#!/bin/ksh
while IFS= read -ra fields
do
        # display $line or do something with $line
	iso_code=${fields[0]}	
    continent=${fields[1]}
    location=${fields[2]}		
    date=${fields[3]}		
    total_cases=${fields[4]}
    new_cases=${fields[5]}	
    #new_cases_smoothed	
    total_deaths=${fields[7]}	
    new_deaths=${fields[8]}	
    #new_deaths_smoothed	
    total_cases_per_million=${fields[10]}		
    new_cases_per_million=${fields[11]}	
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
done < <(tail -n +2 owid-covid-data.csv)

for i in {0..50} ;
do
    echo ${iso_code[i]}
done

#check for the user input

echo "Please enter the header name for the data you'd like to examine"
read dataSet

#error check
while [ ! $dataSet == "iso_code" ] && [ ! $dataSet == "continent" ] && [ ! $dataSet == "location" ] && [ ! $dataSet == "date" ] && [ ! $dataSet == "total_cases" ] && [ ! $dataSet == "new_cases" ] && [ ! $dataSet == " total_deaths" ] && [ ! $dataSet == "new_deaths" ] && [ ! $dataSet == "total_cases_per_million" ] && [ ! $dataSet == "new_cases_per_million" ];
do
    echo "ERROR: Data set not found"               
    echo "Please enter a different data set header to try again"
    read dataSet
done  

echo "Please enter the reference country name"
read refCountry

echo "Please enter the header name for the name of a comparison country"
read compCountry