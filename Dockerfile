# Usar una imagen base de OpenJDK
FROM openjdk:11-jre-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/saamfi-rest/target/saamfiapi.war /app/saamfi-backend.war

EXPOSE 8087

# Run the Spring Boot app
CMD ["java", "-jar", "/app/saamfi-backend.war"]