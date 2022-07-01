# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ghcr.io/parkervcp/yolks:nodejs_17

RUN         apk add --no-cache --update openjdk11 \
            
# Setup JAVA_HOME -- useful for docker commandline
ENV         JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN         export JAVA_HOME
