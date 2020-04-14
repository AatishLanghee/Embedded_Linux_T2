
######################################################################################################################################

# Author: Aatish Langhee (MIS: 121735011)

# T2: Program-1: Write a shell script to find out if PC has a internet connection or not.

# Here I am pinging to Google's DNS server 8.8.8.8. If it returns data/packet transmission means your internet connection is working.

# "-c" : Number of packets to send to the server/host.
# "-w" : To stop pingig after specific time. 
# "> /dev/null" : Redirecting logs (which are printing on console) to null so that logs will not print at console.  

######################################################################################################################################

#!/bin/sh

echo "Checking Internet Connectivity ... Please, wait for 5 seconds!"
if ping -c 5 -W 5 8.8.8.8 > /dev/null ;
then
  echo "Your Internet Connection is UP!"
else
  echo "Your Internet Connection is DOWN!"
fi

