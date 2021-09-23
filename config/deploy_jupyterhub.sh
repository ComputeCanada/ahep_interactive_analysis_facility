helm upgrade --cleanup-on-fail \
  --install jupyterhub ./jupyterhub \
  --values ./jupyterhub/config.yaml 
#  --namespace dune 
#  --create-namespace 
#  --install jhub jupyterhub/jupyterhub \
