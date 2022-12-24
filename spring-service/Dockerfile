# # Method 1 
# # Dcker build 
# FROM maven:3.8.6-amazoncorretto-11  AS build
# RUN mkdir -p /springServiceTmp
# WORKDIR /springServiceTmp
# COPY pom.xml /springServiceTmp
# COPY src /springServiceTmp/src
# # RUN mvn -f pom.xml clean package
# RUN mvn -f pom.xml clean package -DskipTests

# FROM amazoncorretto:11-alpine-jdk
# COPY --from=build /springServiceTmp/target/*.jar SpringService.jar
# EXPOSE 8091
# ENTRYPOINT ["java","-jar","SpringService.jar"]

# FROM amazoncorretto:11-alpine-jdk
FROM amazoncorretto:11-alpine-jdk
COPY /target/*.jar SpringService.jar
EXPOSE 8091
ENTRYPOINT ["java","-jar","SpringService.jar"]