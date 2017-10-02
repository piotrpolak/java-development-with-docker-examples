#!/bin/bash

if [ -z $(docker images -q 02_sample:latest) ]
then
    # Cloning the project alongside
    if [ ! -d tmp_project ]
    then
        git clone https://github.com/piotrpolak/android-http-server.git --depth=1 tmp_project && \
            cd tmp_project && \
            ./gradlew :cli:fatJar -PskipAndroidBuild
        cd ..
    fi

    # Preventing error ADD failed: Forbidden path outside the build context: ../shared/conf/httpd.properties
    cp -r ../shared/conf .
    cp -r ../shared/www .

    docker build -t 02_sample .

    # Cleanup
    rm -rf ./conf ./www
fi

docker run -it 02_sample