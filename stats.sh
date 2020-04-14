
######################################################################################################################################

# Author: Aatish Langhee (MIS: 121735011)

# T2: Program-3: Write a shell script to print RAM usage, disk usage and CPU usage in tabular form. Also, print name of the process that is consuming most CPU at that time instant.

# Here I am printing stats such as Memory (% of RAM being used by all process together) , Disk ( Total disk consumed by all resources) , process ( name of the process that is consuming most CPU at that time instant), CPU ( % of cpu consumed by that process at that time instant)
######################################################################################################################################



#! /bin/bash

SECONDS=1
printf "Time(24 Hours)\t\tMemory\t\tDisk\t\tProcess\t\tCPU\n"
end=$((SECONDS+3600))

while  [ $SECONDS -lt $end ]
do
CURRENTDATE=`date +"%d-%b-%Y %T"`
MEMORY=$(free -m | awk 'NR==2{printf " \t%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
Process=$(ps -eo comm,pcpu --sort=-%cpu | head -n 2 | egrep -v '(0.0)|(%CPU)')
echo  ${CURRENTDATE} "$MEMORY$DISK$Process"
SECONDS=$((SECONDS+1))
sleep 5
done
   
