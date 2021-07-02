FROM ubuntu:20.04
MAINTAINER "ArthurWuTw <lion811004@gmail.com>"

ARG CONTAINER_USER
ARG HOST_USER_GID
ARG HOST_USER_UID
ARG TIMEZONE

WORKDIR /tmp

# Disable interactive configuration
ENV DEBIAN_FRONTEND=noninteractive

# Setup the host's timezone
RUN apt-get update && \
  ln -sf /usr/share/zoneinfo${TIMEZONE:?} /etc/localtime && \
  apt-get install -y tzdata

# Create user
COPY create-user utils.sh ./
RUN ./create-user && \
  rm create-user utils.sh

# Install host's certification
RUN apt-get update && \
  apt-get install -y ca-certificates && \
  update-ca-certificates

# Install apt-getable dependencies
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        python \
        git \
        curl \
        openssh-server \
        git-core \
        net-tools \
        vim \
        gcc

# Install Zulu JDK 8
COPY install-jdk utils.sh ./
RUN ./install-jdk && \
  rm install-jdk utils.sh

ENV PATH="/opt/zulu8.54.0.21-ca-jdk8.0.292-linux_x64/bin:${PATH}"
ENV JAVA_HOME="/opt/zulu8.54.0.21-ca-jdk8.0.292-linux_x64"




# Install Gradle

COPY enter-container-shell \
    infinite-loop \
    /usr/local/bin/
RUN chmod +x /usr/local/bin/infinite-loop
RUN chmod +x /usr/local/bin/enter-container-shell
