FROM adoptopenjdk/openjdk11:jdk-11.0.8_10-alpine as builder
WORKDIR application
ARG JAR_FILE=tduck-api.jar
COPY ${JAR_FILE} app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM adoptopenjdk/openjdk11:jdk-11.0.8_10-alpine
WORKDIR application
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./

CMD ["java", "org.springframework.boot.loader.JarLauncher"]
#ENTRYPOINT ["java","org.springframework.boot.loader.JarLauncher"]
