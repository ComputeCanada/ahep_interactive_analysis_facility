ARG ROOT_CONTAINER=axionhub/dune-notebook-sl7
FROM $ROOT_CONTAINER

LABEL maintainer="Tejin Cai"



USER root
ADD jupyter-remote-desktop-proxy/. /opt/install/
ADD session.conf /usr/share/dbus-1/session.conf
RUN fix-permissions /opt/install
RUN cd /opt/install && \
    mamba env update -n base --file environment.yml


RUN yum groupinstall "Xfce" -y -q
RUN yum install eog xterm caja gedit -y -q && \
   yum clean all && rm -rf /var/cache/yum/*


# Remove light-locker to prevent screen lock
ARG TURBOVNC_VERSION=2.2.7
ARG TURBOVNC_NAME="turbovnc-${TURBOVNC_VERSION}.x86_64.rpm"
ADD ${TURBOVNC_NAME} .
RUN yum install -y -q ./${TURBOVNC_NAME} && \
    yum remove -y -q light-locker && \
    rm ./${TURBOVNC_NAME} && \
    ln -s /opt/TurboVNC/bin/* /usr/local/bin/
RUN chown -R $NB_UID:$NB_GID $HOME
USER $NB_USER
