ARG ROOT_CONTAINER=axionhub/base-notebook
FROM $ROOT_CONTAINER

LABEL maintainer="Tejin Cai"

USER root

ARG NB_VO="dune"
ARG NB_VOID="9010"

COPY config/repos/* /etc/yum.repos.d/

RUN yum -y install osg-wn-client  \
                   xrootd-client \
                   xrootd-client-libs \
                   voms-clients-java && \
    yum clean all && rm -rf /var/cache/yum/*


#sssd \
#sssd-common \
#sssd-client \
#sssd-tools \
#sssd-ldap \
#sssd-krb5-common \
#sssd-krb5 \

RUN yum install -y https://research.cs.wisc.edu/htcondor/repo/9.0/el7/release/htcondor-release-9.0-2.el7.noarch.rpm && \
    yum install -y --disablerepo=osg condor && \
    yum clean all && rm -rf /var/cache/yum/*

RUN mamba install --quiet --yes -c conda-forge \
    'xrootd' \
    'dask' \
    'dask-gateway' \
    'ipywidgets' && \
    mamba clean --all -f -y  

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
