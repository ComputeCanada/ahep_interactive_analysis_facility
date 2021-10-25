kubectl delete -k osg-k8s-cvmfs/cvmfs-daemonset
kubectl delete -k osg-k8s-cvmfs/cvmfs-pvcs
kubectl delete -k osg-k8s-cvmfs/namespaces/jupyterhub/cvmfs-pvcs/
#helm uninstall cvmfs -n cvmfs
#kubectl delete namespace cvmfs
