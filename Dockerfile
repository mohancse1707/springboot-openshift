FROM maven:3.8-openjdk-11 as build
WORKDIR /opt/app
COPY . .
RUN mvn install

# For Java 8, try this
FROM openjdk:8-jdk-alpine

# For Java 11, try this
# FROM adoptopenjdk/openjdk11:alpine-jre

# Refer to Maven build -> finalName
ARG JAR_FILE=target/review-service-1.0.0.jar
	
# cd /opt/app
WORKDIR /opt/app

COPY ${JAR_FILE} springboot.jar

ENTRYPOINT ["java","-jar", "springboot.jar"]
