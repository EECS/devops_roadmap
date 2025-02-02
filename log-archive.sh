#!/bin/bash

#### Project Description - log-archive.sh ####
# In this project, you will build a tool to archive logs on a set schedule by compressing them and storing them in a new directory, 
# this is especially useful for removing old logs and keeping the system clean while maintaining the logs in a compressed format 
# for future reference.

# The most common location for logs on a unix based system is /var/log.
# Requirements

# The tool should run from the command line, accept the log directory as an argument, compress the logs, and store them in a new directory. The user should be able to:

#     Provide the log directory as an argument when running the tool.

#     log-archive <log-directory>

#     The tool should compress the logs in a tar.gz file and store them in a new directory.
#     The tool should log the date and time of the archive to a file.

#     logs_archive_20240816_100648.tar.gz

## Begin the script below ##

# Throw an error if any command fails
set -e

# Provide the log directory as an argument when running the tool.
log_directory=$1

# Throw an error if the user does not provide a log directory
# -z flag checks if the provided arg is empty
if [ -z $log_directory ]; then
  echo "Please provide a log_directory arg"
  exit 1
fi

# Throw an error if the log directory does not exist
# -d flag checks if the provided path is a directory
if [ ! -d $log_directory ]; then
  echo "The log directory does not exist, please correct the path"
  exit 1
fi

# The tool should compress the logs in a tar.gz file and store them in a new directory.
# The new directory should be named logs_archive_<date>_<time>.tar.gz
archive_name="logs_archive_$(date +'%Y%m%d_%H%M%S').tar.gz"
echo "Archiving logs in $log_directory to $archive_name"

# Create a new directory to store the archive
mkdir -p tmp

# Compress the logs in the log directory
# -c flag creates a new archive
# -z flag compresses the archive using gzip
# -f flag specifies the filename of the archive
if tar -czf tmp/$archive_name $log_directory
then
  # The tool should log the date and time of the archive to a file.
    echo "Archived logs in '$log_directory' to $archive_name on $(date +'%Y-%m-%d %H:%M:%S')" >> archive.log
    exit 0
else
    echo "Failed to archive logs"
    rm -rf tmp
    exit 1
fi

### End of script ###