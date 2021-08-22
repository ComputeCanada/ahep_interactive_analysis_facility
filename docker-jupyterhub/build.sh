#!/bin/bash
docker build --target builder -t tejinc/dune_iaf:sl7 .
docker build --target builder1 -t tejinc/dune_iaf:sl7-root .
docker build --target final -t tejinc/dune_iaf:jupyterhub-dev .
