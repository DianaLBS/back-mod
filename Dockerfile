# Etapa 1: Construir el proyecto
FROM maven:3.8.6-openjdk-11-slim AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código fuente del proyecto
COPY . /app

# Ejecutar Maven para construir el proyecto y generar el archivo WAR
RUN mvn clean install

# Etapa 2: Crear la imagen de ejecución
FROM openjdk:11-jre-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo WAR desde la etapa de construcción
COPY --from=build /app/saamfi-rest/target/saamfiapi.war /app/saamfi-backend.war

# Exponer el puerto
EXPOSE 8087

# Ejecutar la aplicación Spring Boot
CMD ["java", "-jar", "/app/saamfi-backend.war"]
