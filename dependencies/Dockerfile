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

# Install JDK 8 and weblogic
RUN apt-get install -y alien \
    libxrender1 \
    libxtst6 \
    libxi6
RUN mkdir -p /home/${CONTAINER_USER}/lib/oraInst.loc
RUN chmod +x /home/${CONTAINER_USER}/lib/oraInst.loc
COPY oracle/invPtrLoc.config \
     oracle/fmw_12.1.3.0.0_wls.jar \
     oracle/responseFile \
     oracle/script-run-inst-weblogic \
     oracle/script-weblogic-config \
     oracle/script-start-weblogic /home/${CONTAINER_USER}/lib/

COPY install-jdk utils.sh oracle/jdk-8u291-linux-x64.tar.gz oracle/createCentralInventory.sh ./
RUN ./install-jdk && \
  rm install-jdk utils.sh jdk-8u291-linux-x64.tar.gz

ENV PATH="/home/${CONTAINER_USER}/lib/jdk1.8.0_291/bin:${PATH}"
ENV JAVA_HOME="/home/${CONTAINER_USER}/lib/jdk1.8.0_291"

# Install GUI Utils
RUN apt-get update \
    && apt-get install -y \
        firefox \
        nautilus

# Install Eclipse
COPY install-eclipse utils.sh eclipse/eclipse-jee-2020-03-R-incubation-linux-gtk-x86_64.tar.gz ./
RUN ./install-eclipse && \
  rm install-eclipse utils.sh eclipse-jee-2020-03-R-incubation-linux-gtk-x86_64.tar.gz

COPY enter-container-shell \
    infinite-loop \
    /usr/local/bin/
RUN chmod +x /usr/local/bin/infinite-loop
RUN chmod +x /usr/local/bin/enter-container-shell
