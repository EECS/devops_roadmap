# Overview

`log-analysis.sh` is a bash script that analyzes log files in a directory.

## Description

The script will print the following statistics:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

Project URL: <https://roadmap.sh/projects/nginx-log-analyser>

## Running the Script

The script is written in bash and can be run with the following command:

```bash
./log-analysis.sh
```

It assumes that the provided logs from the project repo are stored in `data/nginx-access.log`.
