FROM anapsix/alpine-java

# Hard-copies binary, configuration and sample HTML document
ADD ./tmp_project/cli/build/libs/cli-all.jar /app/cli-all.jar
ADD ./conf/httpd.properties /app/httpd/httpd.properties
ADD ./conf/mime.type /app/httpd/mime.type
ADD ./www/ /app/httpd/www/

EXPOSE 8080 8080

WORKDIR /app
CMD java -jar cli-all.jar