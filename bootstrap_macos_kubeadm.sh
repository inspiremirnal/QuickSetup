#!/bin/bash

echo -e "Starting provisioning multipass hyperkit backed VMs Master."
echo -e "Spinning up master nodes ...."

for name in 1 2
do
    multipass launch --name master-${name} -c 2 -m 2G -d 10g --cloud-init ./cloud-config-kubeadm.yaml 
done

echo -e "Spinning up worker nodes ..."
for name in 1 2
do
      multipass launch --name worker-${name} -c 2 -m 2G -d 10g --cloud-init ./cloud-config-kubeadm.yaml
done      

echo -e "starting loadbalancer VM..."
multipass launch --name loadbalancer --cloud-init ./cloud-config-haproxy.yaml