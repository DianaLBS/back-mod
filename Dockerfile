# Usar una imagen base con Java (ajusta la versión de Java según corresponda)
FROM openjdk:11-jre-slim

# Definir el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo WAR o JAR de tu aplicación al contenedor
COPY target/saamfi2-backend.jar /app/saamfi2-backend.jar

# Exponer el puerto de la aplicación
EXPOSE 8087

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "/app/saamfi2-backend.jar"]
