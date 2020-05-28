#!/bin/bash

echo -e "running trial instance ...."
multipass launch --name "trial" --cloud-init ./cloud-config-kubeadm.yaml