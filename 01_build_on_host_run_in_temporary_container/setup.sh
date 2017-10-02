#!/bin/bash

# Cloning the project alongside
if [ ! -d tmp_project ]
then
    git clone https://github.com/piotrpolak/android-http-server.git --depth=1 tmp_project && \
        cd tmp_project && \
        ./gradlew :cli:fatJar -PskipAndroidBuild
    cd ..
fi

docker run \
    -it \
    --rm -w=/app \
    --volume=`pwd`/../shared/conf/httpd.properties:/app/httpd/httpd.properties \
    --volume=`pwd`/../shared/conf/mime.type:/app/httpd/mime.type \
    --volume=`pwd`/../shared/www/:/app/httpd/www/ \
    --volume=`pwd`/tmp_project/cli/build/libs/cli-all.jar:/app/cli-all.jar \
    --name=01_sample \
    -p 8080:8080 \
    anapsix/alpine-java \
    java -jar cli-all.jar

