helm upgrade --cleanup-on-fail \
  --install jupyterhub jupyterhub/jupyterhub \
  --values config.yaml  \
  --namespace jupyterhub \
  --create-namespace \