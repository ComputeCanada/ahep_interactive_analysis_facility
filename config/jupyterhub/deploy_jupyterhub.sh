helm upgrade --cleanup-on-fail \
  --install jhub jupyterhub/jupyterhub \
  --values config.yaml 
#  --namespace dune \
#  --create-namespace \
