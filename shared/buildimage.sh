#!/bin/bash

# Building the latest image https://github.com/anapsix/docker-alpine-java / https://hub.docker.com/r/anapsix/alpine-java/

rm -rf Dockerfile*
wget https://raw.githubusercontent.com/anapsix/docker-alpine-java/master/8/144b01/jdk/standard/Dockerfile
docker build . --label samplejava
rm -rf Dockerfile
