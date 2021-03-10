FROM java:8
EXPOSE 8999

VOLUME /tmp
ADD target/tduck-api.jar /app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]
