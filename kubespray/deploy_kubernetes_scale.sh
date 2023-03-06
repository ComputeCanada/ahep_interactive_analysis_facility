#ansible-playbook -i k8s-terraform/out.json cluster.yml --check #--become --become-user root 
#ansible-playbook -i k8s-terraform/hosts cluster.yml --check #--become --become-user root 
ansible-playbook -i static_hosts/all.yml scale.yml  --become --become-user root 
