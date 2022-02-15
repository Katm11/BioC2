cd ~/
echo "Enter Concentration Level, either 00 or 05:  "
read Concen

if [ $Concen -eq 00 ]
then
    Folder=ERP00
elif [ $Concen -eq 05]
then
    Folder=ERP05
else
    echo "ERROR: Invalid Concentration, File not Found"
exit
fi

unset Concen    #clear variable for reuse

#Combine (cat) all files from the correct folder into one file

newData="/home/mezak/BioC2/Lab1/EEG_DATA/catted_data.dat"

#error check so you dont overwrite existing file

if [ -e $newData]
then
    rn $newData
fi

#get all files from specified folder without having to type them manually

for file in "/home/mezak/BioC2/Lab1/EEG_DATA/$Folder/*"
do
    cat $file >> $newData
done

newFile=/home/mezak/BioC2/Lab1/EEG_DATA/"$Folder"_HAnalysis.txt

#add filepath for histogram.exe (echo /home/mezak/BioC2/Lab1/EEG_DATA/catted_data.dat) | (~/lib/) > $Hist_Output

echo "Results stored in $Hist_Output"