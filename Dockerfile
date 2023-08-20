FROM ubuntu:18.04
MAINTAINER Emperor Servers <support@emperorservers.com>

ENV DEBIAN_FRONTEND noninteractive
ENV SERVER_USER assetto
ENV SERVER_MANAGER_DIR /home/${SERVER_USER}/server-manager
ENV SERVER_INSTALL_DIR ${SERVER_MANAGER_DIR}/assetto

ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y build-essential libssl-dev curl lib32gcc1 lib32stdc++6 zlib1g zlib1g lib32z1 ca-certificates && rm -rf /var/lib/apt/lists/*

ENV STEAMCMD_URL="http://media.steampowered.com/installer/steamcmd_linux.tar.gz"
ENV STEAMROOT=/opt/steamcmd

# steamcmd
RUN mkdir -p ${STEAMROOT}
WORKDIR ${STEAMROOT}
RUN curl -s ${STEAMCMD_URL} | tar -vxz
ENV PATH "${STEAMROOT}:${PATH}"

# update steam
RUN steamcmd.sh +login anonymous +quit; exit 0

RUN useradd -ms /bin/bash ${SERVER_USER}

RUN mkdir -p ${SERVER_MANAGER_DIR} && mkdir ${SERVER_INSTALL_DIR}

ADD server-manager ${SERVER_MANAGER_DIR}/server-manager
ADD assetto-multiserver-manager ${SERVER_MANAGER_DIR}/assetto-multiserver-manager

RUN chmod +x ${SERVER_MANAGER_DIR}/server-manager ${SERVER_MANAGER_DIR}/assetto-multiserver-manager

RUN chown -R ${SERVER_USER}:${SERVER_USER} ${SERVER_MANAGER_DIR}
RUN chown -R ${SERVER_USER}:${SERVER_USER} ${SERVER_INSTALL_DIR}

USER ${SERVER_USER}
WORKDIR ${SERVER_MANAGER_DIR}

HEALTHCHECK CMD curl --fail http://localhost:8772/healthcheck.json || exit 1

# recommend volume mounting the entire assetto corsa directory
VOLUME ["${SERVER_INSTALL_DIR}"]
EXPOSE 8772
EXPOSE 9600
EXPOSE 8081

ENTRYPOINT ["./server-manager"]
