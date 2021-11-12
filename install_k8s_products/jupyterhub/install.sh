helm upgrade --cleanup-on-fail \
  --install jupyterhub jupyterhub/jupyterhub \
  --values config.yaml.work  \
  --namespace jupyterhub \
  --create-namespace \
