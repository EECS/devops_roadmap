# Overview

This folder contains the solution for the Basic Dockerfile project. The project is part of the DevOps track on [roadmap.sh](https://roadmap.sh).

## Requirements

- The Dockerfile should be named Dockerfile.
- The Dockerfile should be in the root directory of the project.
- The base image should be alpine:latest.
- The Dockerfile should contain a single instruction to print - - - “Hello, Captain!” to the console before exiting.

## Stretch Goal

- Create a Docker image that prints “Hello, [your name]!” to the console instead of “Hello, Captain!”.

## Installing Docker on Ubuntu

To install Docker on Ubuntu, you can follow the instructions on the official Docker documentation [here](https://docs.docker.com/engine/install/ubuntu/).

## Dockerfile Details

Below is the content of the Dockerfile:

```Dockerfile
from alpine:latest

CMD ["echo", "Hello, Captain!"]
```

## Building the Docker Image

To build the Docker image, run the following command:

```bash
docker build -t basic-dockerfile .
```

## Running the Docker Container

To run the Docker container, use the following command:

```bash
docker run basic-dockerfile
```

## Building Dockerfile.stretch

To build the Docker image with the stretch goal, run the following command:

```bash
docker build -t stretch-dockerfile -f Dockerfile.stretch .
```

## Stretch Dockerfile Details

Below are several things to know about Dockerfile.stretch:

- Because the base image is alpine:latest, it does not have bash installed automatically. A step in the Dockerfile installs bash as a result
- In order to pass an argument to the Dockerfile, ENTRYPOINT is used instead of CMD to allow for the argument to be passed to the script.
