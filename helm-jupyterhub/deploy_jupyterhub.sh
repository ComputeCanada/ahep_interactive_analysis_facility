
if [ -f "config.yml" ]; then
	echo "config.yml exists"
else
	echo "# This file can update the JupyterHub Helm chart's default configuration values." > config.yml
	echo "#" >> config.yml
	echo "# For reference see the configuration reference and default values, but make" >>config.yml
	echo "# sure to refer to the Helm chart version of interest to you!" >>config.yml
	echo "#" >>config.yml
	echo "# Introduction to YAML:     https://www.youtube.com/watch?v=cdLNKUoMc6c" >>config.yml
	echo "# Chart config reference:   https://zero-to-jupyterhub.readthedocs.io/en/stable/resources/reference.html" >>config.yml
	echo "# Chart default values:     https://github.com/jupyterhub/zero-to-jupyterhub-k8s/blob/HEAD/jupyterhub/values.yaml" >>config.yml
	echo "# Available chart versions: https://jupyterhub.github.io/helm-chart/" >>config.yml
	echo "#" >>config.yml
	echo "config.yml created"
fi

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update

helm_release_name=v1
k8s_namespace=dune
ver=1.1.3
helm upgrade --cleanup-on-fail \
  --install $helm_release_name jupyterhub/jupyterhub \
  --namespace $k8s_namespace \
  --create-namespace \
  --version=$ver \
  --values config.yml
