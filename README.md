# QuickSetup

Simple Setup for practicing K8s the hard way on local environment using Multipass. This currently works only for macos with hyperkit enabled.
Multipass enables launching of ubuntu instances quick and easy with latest ubuntu images.
It is well integrated with cloud-init, which is a industry standard for cross-platform cloud
instance initialization. This means we can actively test the config changes in local environment
setup.

## Mulitpass Installation

<https://multipass.run/docs/installing-on-macos>

<https://multipass.run/docs>

## Cloud-init Documenation (No installation required)

<https://cloudinit.readthedocs.io/en/latest/>

The bash script nothing sort of very advance , just have simple for statement to spin-up few instances with cloud-init config as parameter. The cloud-init files consists of instruction to setup the required packages post instance boot.

This good in scenarios when you don't want to invest time and money with cloud-provider and just want to setup K8s HA setup to get an idea around the components and methodologies to perform the setup TLS bootstraping of nodes etc.

Also, this allows everyone to get acquainted with cloud-init and how it works, most of the people spent time with AWS EC2 , this is what powers it, the user-data section where
we put the custom bootstrap logic , becomes part of cloud-init eventually and then gets executed eventually.

This is not a final stage , i will be adding arguments to bash to simplify the bootstrapping, but for now it is ready to have some fun.

The cloud-init , configs just installs all the packages and nothing more , the setup like running kubeadm or setting the k8s hardway still needs to be performed. The idea was to quickly
provision infra locally to perform practice or researching or simulating some problem etc.


### Scripts
```
users:
  - name: ubuntu
    ssh-authorized-keys:
      - ssh-rsa AAAAB3.........
```

      
The above module is present in all the config files , and the ssh-rsa section needs to be updated with correct ssh public key to allow easy ssh access to the instances.Otherwise as a back up`multipass shell <instance-name>` works as well.

`bootstrap_macos.sh` in its simplicity spins up 2 master and 2 worker nodes, also installed required packages such as docker , sets daemon.json with correct cground driver , apiserver , controller , kubelet , scheduler , kubectl , kube-proxy binaries etc with correct permissions.

from there on its easy to refer to `kubernetes-the-hard-way` guide and perform the setup.

`bootstrap_macos_kubeadm.sh` does teh similar thing , but get the instances ready for cluster bootstraping using kubeadm.

### Clean-up
```cleanup.sh``` will do the instances clean-up reclaiming all the resources back :)
