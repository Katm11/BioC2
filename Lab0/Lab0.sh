#Name: Kat Meza 
#Assignment: Lab O
#Date: 1/25/22
#Description: Lab 0 Part 3 - execute a bash script in your chosen text editor to count the number of ALL files/directories in your home directory.  Output the names of all your files as 
#well as the total number of files to the screen.

cd ~/
printf "Number of files: "
ls -a|wc -l
printf "\n"
printf "File Names: \n"
ls -a