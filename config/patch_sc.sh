
sc_old=standard
sc_new=csi-cinder-sc-delete
kubectl patch storageclass $sc_old -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
kubectl patch storageclass $sc_new -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
