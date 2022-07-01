# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        node:8-alpine

LABEL       author="Myzumi" maintainer="private@nothing.de"

RUN         apk add --no-cache --update libc6-compat ffmpeg openjdk11 \
            && adduser -D -h /home/container container
            

# Setup JAVA_HOME -- useful for docker commandline
ENV         JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN         export JAVA_HOME


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
