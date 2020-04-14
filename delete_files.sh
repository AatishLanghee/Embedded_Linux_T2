
######################################################################################################################################

# Author: Aatish Langhee (MIS: 121735011)

# T2: Program-2: Write a shell script to find files of size below certain value and delete those files in a directory and its subdirectory.
# ./delete_files.sh 1024 /home/user1/tmp (this will delete files of size less than 1024 bytes in directory /home/user1/tmp and its subdirectories).

# Here I have used "find" command to find files below specified size value and "stat" command to get folder permission numerical notation. I have done error checking for negative size value and folder permissions.

######################################################################################################################################


#!/bin/sh

flag="False"


if [  "$1" = "" ] ;
then
    printf "Please enter the correct file size.\nYou have not specified the file size.\n"
    exit 1

elif [ $1 -lt 0 ] ;
then
    printf "Please enter the correct file size.\nYou have specified file size as $1 bytes.\n"
    exit 1

elif [ $1 -gt 0 ] &&  [ "$2" = "" ] ;
then
    printf "Please enter the correct directory.\nYou have not specified directory.\n"
    exit 1

elif [ $1 -gt 0 ] &&  [ "$2" != "" ];
then
    echo "File size specified : $1 bytes"
    echo "Directory specified : $2 "
    folders=$(find $2 -type d 2>&1 | grep -v "Permission denied")
    for folder in $folders ; do  
       folder_permission=$(stat -c %a $folder)

       if [ $folder_permission -lt 755 ] ;
       then
           flag="True"
       fi
     done
fi

if [ $flag == 'True' ] ;
then
    printf "You dont have enough folder permissions. \nPlease check the folder permission for folder : $folder\n"
else
    echo "Files below size $1 bytes are getting deleted.."
    find $2 -type f -size -$1c -print -delete 
    echo "Compeleted!"    
fi

