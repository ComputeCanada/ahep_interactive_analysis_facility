#helm upgrade --cleanup-on-fail \
#  --install cinder-csi ../../plugins/cloud-provider-openstack/charts/cinder-csi-plugin/ \
#  -f config.yaml \
#  --namespace kube-system 

#helm repo add cpo https://kubernetes.github.io/cloud-provider-openstack
#helm repo update

helm upgrade --cleanup-on-fail \
     --install cinder-csi cpo/openstack-cinder-csi \
     -f config.yaml \
     --namespace kube-system
