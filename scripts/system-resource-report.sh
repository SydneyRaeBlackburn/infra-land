#! /bin/bash

DATE=$(date +%Y-%m-%d)
REPORT="/root/resource-reports/report-$DATE.txt"
mkdir -p /root/resource-reports/

echo "System Resource Report for $DATE" > $REPORT
echo "=================================" >> $REPORT

echo -e "\nUptime and Load Averages:" >> $REPORT
uptime >> $REPORT

echo -e "\nMemory Usage:" >> $REPORT
free -h >> $REPORT

echo -e "\nDisk Usage:" >> $REPORT
df -h >> $REPORT

echo -e "\nTop CPU Processes:" >> $REPORT
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 10 >> $REPORT

echo -e "\nTop Memory Processes:" >> $REPORT
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 10 >> $REPORT
