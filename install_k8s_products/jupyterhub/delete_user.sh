#!/bin/bash

user=$1

rm /mnt/dune/*/$1 -r

nss_wrapper.pl --passwd_path /mnt/data_store/jupyter_data/passwd --group_path /mnt/data_store/jupyter_data/group --action delete --type member --name dune --member $1
nss_wrapper.pl --passwd_path /mnt/data_store/jupyter_data/passwd --group_path /mnt/data_store/jupyter_data/group --action delete --type member --name users --member $1
nss_wrapper.pl --passwd_path /mnt/data_store/jupyter_data/passwd --group_path /mnt/data_store/jupyter_data/group --action delete --type passwd --name $1
