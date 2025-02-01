#!/bin/bash

# write a script server-stats.sh that can analyse basic server performance stats. You should be able to run the script on any Linux server and it should give you the following stats:

#     Total CPU usage
#     Total memory usage (Free vs Used including percentage)
#     Total disk usage (Free vs Used including percentage)
#     Top 5 processes by CPU usage
#     Top 5 processes by memory usage

# Start the script below

# Total CPU usage
echo "Total CPU usage"
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "% CPU used"}'

# Total memory usage (Free vs Used including percentage)
echo "Total memory usage"
# Free shows the total amount of free and used physical and swap memory in the system, as well as the buffers used by the kernel, in MB.
free -m | grep Mem | awk '{printf "Used: %dMB, Free: %dMB, Usage: %.2f%%\n", $3, $4, $3/$2*100}'

# Total disk usage (Free vs Used including percentage)
echo "Total disk usage"
df -h | grep /dev/sda1 | awk '{printf "Used: %s, Free: %s, Usage: %s\n", $3, $4, $5}'