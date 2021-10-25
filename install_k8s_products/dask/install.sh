helm repo add dask https://helm.dask.org
helm repo update

helm upgrade --install dask dask/dask -f config.yaml --namespace jupyterhub --create-namespace
