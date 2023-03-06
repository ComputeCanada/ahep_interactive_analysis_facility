#ansible-playbook --become --become-user root -i k8s-terraform/hosts reset.yml
#ansible-playbook --become --become-user root -i k8s-terraform/hosts reset.yml
ansible-playbook -i static_hosts/all.yml reset.yml --become --become-user root
