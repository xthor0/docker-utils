# shamelessly stolen and modified: https://github.com/arunvelsriram/utils/blob/master/Dockerfile

FROM ubuntu:bionic

ARG UTILS_USER_GID=1000
ARG UTILS_USER_UID=1000

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
    locales \
    bind9-host \
    curl \
    dnsutils \
    iputils-ping \
    jq \
    netcat-openbsd \
    net-tools \
    telnet \
    vim \
    nano \
    wget \
  && rm -rf /var/lib/apt/lists/*

# Locale setup
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Unprivileged user setup
RUN groupadd --gid ${UTILS_USER_GID} utils \
  && useradd --uid ${UTILS_USER_UID} --gid ${UTILS_USER_GID} \
    --shell /bin/bash --create-home utils
USER utils
WORKDIR /home/utils

CMD ["sleep", "infinity"]