#!/bin/bash
docker build --target builder -f Dockerfile_Base -t tejinc/dune_iaf:sl7 .
docker build --target builder1 -f Dockerfile_Base -t tejinc/dune_iaf:sl7-root .
docker build --target final -f Dockerfile_Base -t tejinc/dune_iaf:jupyterhub-dev .
