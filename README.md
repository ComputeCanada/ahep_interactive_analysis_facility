# ahep_interactive_analysis_facility
Astronomy and High Energy Physics Interactive Analysis Facility on Compute Canada Cloud

## Docker
Built a docker image containing Jupyterhub, ROOT, MAT, and Coffea

## Kubespray
Effectively forked https://github.com/kubernetes-sigs/kubespray with modifications to folder structure. The original instruction in [Kubespray](https://github.com/kubernetes-sigs/kubespray) for OpenStack is outdated because the Terraform API has changed since `0.15`

To deploy a k8s cluster, from the ahep_interactive_analysis_facility root folder, do

`cd kubespray/k8s-terraform/`
Modify `cluster.tfvars` according to needs, source the OpenStack RC file, then 
> `terraform init`
 `terraform apply -var-file=cluster.tfvars`

This will build the clusters according to specification.

Next go back to the `kubespray` folder
> `cd ..`
> `ansible -i k8s-terraform/hosts -m ping all`

This will try to ping all the nodes you just built. If the nodes are unreachable, then there is something wrong with your `ssh` authentication. First make sure you are able to `ssh` into the bastion node. In your local machine, a ssh config file called `ssh-bastion.conf` should have been created under  `kubespray` folder. Add the following line into `ansible.cfg`, modify the `ssh_args` parameter:
> ssh_args = -F ssh-bastion.conf -o ControlMaster=auto -o ControlPersist=30m -o ConnectionAttempts=100 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

Kubernetes can be deployed once every node can be reached. Do the following:
`ansible-playbook --become -i k8s-terraform/hosts cluster.yml`

The `--become` flag is necessary because it allows ansible to run as the admin user. The deployment could fail if the flag is not specified. If the user built a cluster with `etcd` database on the `master` without a dedicated `etcd` node, the build could fail. The solution is to have a dedicated `etcd` node with the `k8s-master` having no `etcd` .

