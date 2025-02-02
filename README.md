# Overview

This project contains multiple scripts seen in the DevOps Roadmap.

## Server Stats

`server-stats.sh` prints simple server statistics for a machine.

The script is written in bash and can be run with the following command:

```bash
./server-stats.sh
```

The script will print the following statistics:

- Total CPU usage
- Total memory usage (Free vs Used including percentage)
- Total disk usage (Free vs Used including percentage)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

Project URL: <https://roadmap.sh/projects/server-stats>

## Log Archive

`log-archive.sh` is a bash script that archives log files in a directory.

The script is written in bash and can be run with the following command:

```bash
./log-archive.sh /path/to/logs
```

The script will create a tarball of the log files in the specified directory and move it to the `/tmp` directory.

Project URL: <https://roadmap.sh/projects/log-archive-tool>

## Log Analysis

`log-analysis.sh` is a bash script that analyzes log files in a directory.

The script is written in bash and can be run with the following command:

```bash
./log-analysis.sh
```

It assumes that the provided logs from the project repo are stored in `data/nginx-access.log`.

The script will print the following statistics:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

Project URL: <https://roadmap.sh/projects/nginx-log-analyser>
