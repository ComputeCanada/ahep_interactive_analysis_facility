#!/bin/bash

#conda create --name analysis --yes
#conda activate analysis
#python -m ipykernel install --user --name=analysis
#
#conda install --quiet --yes -c conda-forge 'xrootd' 'dask' 'dask-gateway' 
#conda clean --all -f -y 

if [[ ! -d /dune/app/$NB_USER/coffea ]]; do
  cd /dune/app/$NB_USER/
  git clone https://github.com/tejinc/coffea.git
  cd coffea
  git checkout dune_dev
  pip install --editable .[dev]
  cd ~
done

mkdir -p ~/.config/dask
echo 'gateway:' > ~/.config/dask/gateway.yaml
echo '  address: "http://traefik-dask-gateway.dask-gateway"' >> ~/.config/dask/gateway.yaml
echo '  auth:' >> ~/.config/dask/gateway.yaml
echo '    type: jupyterhub' >> ~/.config/dask/gateway.yaml
