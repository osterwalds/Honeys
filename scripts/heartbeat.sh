#! /bin/bash

# Log the ip, current time and heartbeat to the file heartbeat.log

echo "" >> /unsafe/logs/heartbeat.log
echo "###############################################" >> /unsafe/logs/heartbeat.log
cat /proc/drivers/rtc | grep rtc_time >> /unsafe/logs/heartbeat.log
echo "-----------------------------------------------" >> /unsafe/logs/heartbeat.log
ip addr show | grep inet >> /unsafe/logs/heartbeat.log
echo "-----------------------------------------------" >> /unsafe/logs/heartbeat.log
echo "I am still here :)" >> /unsafe/logs/heartbeat.log
echo "###############################################" >> /unsafe/logs/heartbeat.log
echo "" >> /unsafe/logs/heartbeat.log
