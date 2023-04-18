# -buster is required to have apt available
FROM openjdk:17-slim-buster

# Optional JVM arguments, such as memory settings
ARG JVM_ARGS=""

# Install curl, then delete apt indexes to save image space
RUN apt update \
    && apt install -y curl \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists

WORKDIR /app

# FIXME properly select last version jar
COPY ./build/libs/*-SNAPSHOT.jar /app/
RUN mv /app/*.jar app.jar

EXPOSE 4000

ENV JVM_ARGS=$JVM_ARGS
ENTRYPOINT [ "sh", "-c", \
    "exec java $JVM_ARGS -jar app.jar"]
