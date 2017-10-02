# We need JDK, you can observe that anapsix/alpine-java:8_jdk is just an extra layer above anapsix/alpine-java
FROM anapsix/alpine-java:8_jdk

# Hard-copies configuration and sample HTML document
ADD ./conf/httpd.properties /app/httpd/httpd.properties
ADD ./conf/mime.type /app/httpd/mime.type
ADD ./www/ /app/httpd/www/

RUN apk --no-cache add git

# Cloning over HTTPS for simplicity (to avoid generating/mounting SSH key)
RUN git clone https://github.com/piotrpolak/android-http-server.git --depth=1 /tmp_project && \
        cd /tmp_project && \
        ./gradlew :cli:fatJar -PskipAndroidBuild && \
        mv /tmp_project/cli/build/libs/cli-all.jar /app/cli-all.jar

# Cleanup
RUN apk del git
RUN rm -rf /tmp_project

EXPOSE 8080 8080

WORKDIR /app
CMD java -jar cli-all.jar