#!/bin/bash

if [ -z $(docker images -q 04_sample:latest) ]
then
    # Cloning the project alongside
    if [ ! -d tmp_project ]
    then
        git clone git@github.com:piotrpolak/android-http-server.git --depth=1 tmp_project && \
            cd tmp_project && \
            ./gradlew :cli:fatJar -PskipAndroidBuild
        cd ..
    fi

    # Preventing error ADD failed: Forbidden path outside the build context: ../shared/conf/httpd.properties
    cp -r ../shared/conf .
    cp -r ../shared/www .

    docker build -t 04_sample .

    rm -rf ./conf ./www # Cleanup
fi

docker run -it --volume=`pwd`/tmp_project/:/tmp_project/ 04_sample