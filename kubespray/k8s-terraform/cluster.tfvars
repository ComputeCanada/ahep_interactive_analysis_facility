# your Kubernetes cluster name here
cluster_name = "axion"

# list of availability zones available in your OpenStack cluster
az_list = ["Compute"]
az_list_node=["Compute"]

# SSH key to use for access to nodes
public_key_path = "~/.ssh/id_rsa.pub"

# image to use for bastion, masters, standalone etcd instances, and nodes
image = "CentOS-7-x64-2020-11"

# user on the node (ex. core on Container Linux, ubuntu on Ubuntu, etc.)
ssh_user = "centos"

# 0|1 bastion nodes
number_of_bastions = 1

flavor_bastion = "b81a5976-d70e-4963-8715-d8f858af148a" #c2-7.5gb-36

# standalone etcds
number_of_etcd = 1
flavor_etcd = "22f7655d-45c1-4e01-83a0-2929e686f19b" #c2-7.5gb-36

# masters
number_of_k8s_masters = 0
number_of_k8s_masters_no_etcd = 0
number_of_k8s_masters_no_floating_ip = 0
number_of_k8s_masters_no_floating_ip_no_etcd = 1
flavor_k8s_master = "57a73012-a294-4caf-b7b8-8e98c8e9bee3" #c8-90gb-288

# nodes
number_of_k8s_nodes = 0
number_of_k8s_nodes_no_floating_ip = 5
flavor_k8s_node = "8c4dad4f-807d-4240-91e0-0fb958a1c671" #c2-15gb-72

# GlusterFS
# either 0 or more than one
number_of_gfs_nodes_no_floating_ip = 0
#gfs_volume_size_in_gb = 40
# Container Linux does not support GlusterFS
image_gfs = "CentOS-7-x64-2020-11"
#image_gfs_uuid = "4cade8a8-d7df-40e8-8bd3-f58e2e17b523"
# May be different from other nodes
ssh_user_gfs = "centos"
flavor_gfs_node = "8c4dad4f-807d-4240-91e0-0fb958a1c671"

# networking
network_name = "axion"

external_net = "6621bf61-6094-4b24-a9a0-f5794c3a881e"

subnet_cidr = "192.168.0.0/24"

floatingip_pool = "Public-Network"

bastion_allowed_remote_ips = ["0.0.0.0/0"]

worker_allowed_ports = [
    {
      "protocol"         = "tcp"
      "port_range_min"   = 30000
      "port_range_max"   = 32767
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "protocol"         = "tcp"
      "port_range_min"   = 22
      "port_range_max"   = 22
      "remote_ip_prefix" = "0.0.0.0/0"
    },

]

master_allowed_ports = [
    {
      "protocol"         = "tcp"
      "port_range_min"   = 22
      "port_range_max"   = 22
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "protocol"         = "tcp"
      "port_range_min"   = 8000
      "port_range_max"   = 9000
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "protocol"         = "tcp"
      "port_range_min"   = 2379
      "port_range_max"   = 2380
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "protocol"         = "tcp"
      "port_range_min"   = 10250
      "port_range_max"   = 10255
      "remote_ip_prefix" = "0.0.0.0/0"
    },


]



wait_for_floatingip=true

master_root_volume_size_in_gb = 40
