#ansible-playbook -i k8s-terraform/hosts cluster.yml --become --become-user root 
#ansible-playbook -i static_hosts/all.yml cluster.yml --become --become-user root  --check
ansible-playbook -i static_hosts/all.yml cluster.yml --become --become-user root   
