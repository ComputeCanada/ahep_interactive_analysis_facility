kubectl apply -k osg-k8s-cvmfs/cvmfs-daemonset
kubectl apply -k osg-k8s-cvmfs/cvmfs-pvcs/
kubectl apply -k osg-k8s-cvmfs/namespaces/jupyterhub/cvmfs-pvcs/
#helm upgrade --cleanup-on-fail \
#  --install cvmfs ../../cvmfs-csi/deployments/helm/cvmfs-csi/ \
#  --values config.yaml  \
#  --namespace cvmfs \
#  --create-namespace \
