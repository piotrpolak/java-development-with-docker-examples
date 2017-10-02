#!/bin/bash

if [ -z $(docker images -q 03_sample:latest) ]
then
    # Preventing error ADD failed: Forbidden path outside the build context: ../shared/conf/httpd.properties
    cp -r ../shared/conf .
    cp -r ../shared/www .

    docker build -t 03_sample .

    rm -rf ./conf ./www # Cleanup
fi

docker run -it 03_sample