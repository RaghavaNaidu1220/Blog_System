FROM maven:4.0.0-openjdk-17 AS build
COPY . .
RUN mvn clean package  -DskipTests

FROM openjdk-17.0.1-jdk-slim
COPY --from=build /target/Blog_System-0.0.1-SNAPSHOT.war Blog_System.war
EXPOSE 8080
ENTRYPOINT ["java","-war","Blog_System.war"]