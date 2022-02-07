helm repo add dask https://helm.dask.org
helm repo update

RELEASE=dask-gateway
NAMESPACE=dask-gateway

helm upgrade --install \
    --namespace $NAMESPACE \
    --create-namespace \
    --values config_gateway.yaml \
    $RELEASE \
    dask-gateway/resources/helm/dask-gateway/
