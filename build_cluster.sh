#!/usr/bin/env bash

ANSIBLE_HOST_KEY_CHECKING=false
PLAYBOOK=k3s-ansible/site.yml
MASTER=`tail ./k3s-ansible/inventory/k3s_nodes.hosts | head -1`
HOSTS=k3s-ansible/inventory/k3s_nodes.hosts
K3S_VERSION='v1.22.5+k3s1'

ansible-playbook \
    -i $HOSTS \
    -u root \
    -e k3s_version=$K3S_VERSION \
    -e systemd_dir=/etc/systemd/system \
    -e master_ip=$MASTER \
    $PLAYBOOK

scp root@$MASTER:~/.kube/config config

echo "reminder to copy config to ~/.kube/config"
