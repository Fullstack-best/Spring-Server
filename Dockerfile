# FROM openjdk:8-alpine
# FROM maven:3.8.6 AS build
# A tester ??
# FROM maven:3.8.6-jdk-8-slim AS build 
# maven withJDK
FROM maven:3.8.6 AS build
# maven without JDK
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
# RUN mvn -f pom.xml clean package
RUN mvn -f pom.xml clean package -DskipTests

FROM openjdk:8-alpine
COPY --from=build /workspace/target/*.jar SpringAuth.jar
EXPOSE 8091
ENTRYPOINT ["java","-jar","SpringAuth.jar"]