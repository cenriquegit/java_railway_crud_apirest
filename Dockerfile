FROM eclipse-temurin:21-jdk as build

COPY . /app
WORKDIR /app

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests
RUN mv -f target/*.jar app.jar

FROM eclipse-temurin:21-jre

COPY --from=build /app/app.jar .

RUN useradd runtime
USER runtime

EXPOSE 8080


ENTRYPOINT ["java", "-Dserver.port=${PORT}", "-jar", "app.jar"]
