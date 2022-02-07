ARG ROOT_CONTAINER=axionhub/base-notebook-sl7
FROM $ROOT_CONTAINER

LABEL maintainer="Tejin Cai"

USER root

ARG NB_VO="dune"
ARG NB_VOID="9010"

COPY config/repos/* /etc/yum.repos.d/


#install dask
RUN mamba install --quiet --yes -c conda-forge \
    'xrootd' \
    'dask' \
    'dask-gateway' \
    'ipywidgets' && \
    mamba clean --all -f -y  

#RUN yum -y install Lmod && \
#    yum clean all && rm -rf /var/cache/yum/*

COPY config/config.d/* /etc/condor/config.d/
COPY config/dune_aliases.sh /etc/profile.d/dune_aliases.sh
COPY config/ups_commands.sh /etc/profile.d/ups_commands.sh
COPY config/init.sh /tmp/init.sh
COPY scripts/nss_wrapper_dune.pl /usr/bin/
COPY scripts/start*sh /usr/local/bin/
#COPY scripts/setup_dune.sh /usr/local/bin/start-notebook.d/

COPY scripts/.condarc scripts/install_products.sh $HOME/

RUN cat /tmp/init.sh >> /usr/local/bin/init.sh && \
    chmod +x /etc/profile.d/dune_aliases.sh && cat /usr/local/bin/init.sh

ENV GRID_USER=${NB_USER}
ENV GROUP=${NB_VO}
ENV EXPERIMENT=${NB_VO}
ENV GROUP_ID=${NB_VOID}

USER $NB_USER

