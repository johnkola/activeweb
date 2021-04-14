spring-boot-api-example/Dockerfile
@tkgregory
tkgregory Add Docker support.
Latest commit be43917 on 28 Mar 2020
 History
 1 contributor
4 lines (4 sloc)  93 Bytes

FROM openjdk:11
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
