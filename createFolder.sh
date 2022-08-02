#!/bin/bash
# A script to create a folder in any directory
folderName=$(zenity --entry --title="Folder Creator" --width=250 --height=250 --text="Name of new folder:")
if [[ $? = 1 ]] 
then
exit 0
else
zenity --question --width=250 --height=200 --text="Do you want a file in the folder?"
if [[ $? = 1 ]] 
then
	directoryName=$(zenity --file-selection --title="Choose the directory to save to" --directory)
	mkdir $directoryName/"$folderName"
else
	fileName=$(zenity --entry --title="Create file" --width=250 --height=250 --text="Name of new file:")
	directoryName=$(zenity --file-selection --title="Choose a directory to save to" --directory)
	mkdir $directoryName/"$folderName"
	touch $directoryName/"$folderName"/"$fileName"
fi
fi
