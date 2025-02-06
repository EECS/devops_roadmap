
### Project Details - Log Analysis ###
# The goal of this project is to help you practice some basic shell scripting skills. You will write a simple tool to analyze logs from the command line.
# Requirements

# Download the sample nginx access log file from here. The log file contains the following fields:

#     IP address
#     Date and time
#     Request method and path
#     Response status code
#     Response size
#     Referrer
#     User agent

# You are required to create a shell script that reads the log file and provides the following information:

#     Top 5 IP addresses with the most requests
#     Top 5 most requested paths
#     Top 5 response status codes
#     Top 5 user agents

### Begin Script ###

# Define the log file
LOG_FILE="data/nginx-access.log"

# Read the log file and extract the required information
# Top 5 IP addresses with the most requests
echo "-----------------------------------"
echo "Top 5 IP addresses with the most requests:"
# awk '{print $1}' - Extracts the IP address from the log file
# sort - Sorts the IP addresses
# uniq -c - Counts the occurrences of each IP address
# sort -nr - Sorts the IP addresses in descending order of count
## -n - Sorts numerically
## -r - Sorts in reverse order
# head -n 5 - Displays the top 5 IP addresses
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo "-----------------------------------"

# Top 5 most requested paths
echo "Top 5 most requested paths:"
# awk '{print $7}' - Extracts the request path from the log file
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo "-----------------------------------"

# Top 5 response status codes
echo "Top 5 response status codes:"
# grep -oE ' [1-5][0-9]{2} ' - Extracts the response status code from the log file
## -o - Outputs only the matching part of the line
## -E - Enables extended regular expressions
## [1-5] - Matches the first digit of the status code (1-5)
## [0-9]{2} - Matches the next two digits of the status code (00-99)
grep -oE ' [1-5][0-9]{2} ' $LOG_FILE | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1 " requests"}' 
echo "-----------------------------------"

# Top 5 user agents
echo "Top 5 user agents:"
# awk -F'"' '{print $6}' - Extracts the user agent from the log file
## -F - Specifies the field separator as double quotes
awk -F'"' '{print $6}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo "-----------------------------------"

### End Script ###