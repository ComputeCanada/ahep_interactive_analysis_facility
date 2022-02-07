#!/bin/bash

echo "Username: $1";
echo "Group: $2";

user_name=$1
group_name=$2
group_id=9010

./nss_wrapper_dune.pl --action add --type group  --passwd_path ${NSS_WRAPPER_PASSWD} --group_path ${NSS_WRAPPER_GROUP} --name ${group_name}
./nss_wrapper_dune.pl --action add --type passwd --passwd_path ${NSS_WRAPPER_PASSWD} --group_path ${NSS_WRAPPER_GROUP} --name ${user_name}   --member ${group_name}  --gid ${group_id}
./nss_wrapper_dune.pl --action add --type member --passwd_path ${NSS_WRAPPER_PASSWD} --group_path ${NSS_WRAPPER_GROUP} --name ${group_name}  --member ${user_name}   --gid ${group_id}

