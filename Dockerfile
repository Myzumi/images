# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        node:8-alpine

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         apk add --no-cache --update libc6-compat ffmpeg \
            && adduser -D -h /home/container container

RUN         apt-get update && \
            apt-get install -y openjdk-8-jdk && \
            apt-get install -y ant && \
            apt-get clean;
    
# Fix certificate issues
RUN         apt-get update && \
            apt-get install ca-certificates-java && \
            apt-get clean && \
            update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV         JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN         export JAVA_HOME


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
