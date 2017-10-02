# We need JDK, you can observe that anapsix/alpine-java:8_jdk is just an extra layer above anapsix/alpine-java
FROM anapsix/alpine-java:8_jdk

# Hard-copies configuration and sample HTML document
ADD ./conf/httpd.properties /app/httpd/httpd.properties
ADD ./conf/mime.type /app/httpd/mime.type
ADD ./www/ /app/httpd/www/

EXPOSE 8080 8080

RUN mkdir /tmp_project

CMD cd /tmp_project && \
    ./gradlew :cli:fatJar -PskipAndroidBuild && \
    mv /tmp_project/cli/build/libs/cli-all.jar /app/cli-all.jar && \
    cd /app/ && \
    java -jar cli-all.jar