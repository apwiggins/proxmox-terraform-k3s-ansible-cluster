# Deploy k3s cluster on Proxmox using Terraform and Ansible

With this [Terraform](https://www.terraform.io) plan you can create one or more virtual machines on [Proxmox](https://www.proxmox.com) and install a k3s cluster automatically on it.

## Reference:
Based on the original work at: https://github.com/BaldFabi/proxmox-terraform-k3s-ansible-cluster.git

## Uses

- A template named _debian-k3s-node_ that was generated using this [repo](https://github.com/BaldFabi/proxmox-packer)
- [Terraform](https://www.terraform.io)
- [Ansible](https://www.ansible.com)
- [telmate/terraform-provider-proxmox](https://github.com/Telmate/terraform-provider-proxmox)
- [k3s-io/k3s-ansible](https://github.com/k3s-io/k3s-ansible)

## Requirements

1. A template (currently named `debian-k3s-node`) on the Proxmox host (without cloud-init)
2. The `root` password currently set to `Abc1234_`
3. A private and public key stored in your home (`~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`)
4. The packages `git` and `ansible` installed

## Variables

| Var name         | Description                                                         | Default |
| ---------------- | ------------------------------------------------------------------- | ------- |
| vm_count         | How many vms should be deployed (min 1 - max 99)                    | 3       |
| proxmox_server   | To which api server should be connected                             |         |
| proxmox_node     | On which node should the vms be created (even in a single node env) |         |
| proxmox_username | Which username should be used to authenticate (e.g. user@pve)       |         |
| proxmox_password | The password for the given user                                     |         |

### Create a `terraform.tfvars` file

You can create a `terraform.tfvars` ([documentation](https://www.terraform.io/language/values/variables#variable-definitions-tfvars-files)) to provide all necessary variables. This file is also included within the `.gitignore` file

```text
vm_count = 3
proxmox_node = "your_node"
proxmox_server = "your_node.with.fqdn_or_ip"
proxmox_username = "your_user@the_configured_realm"
```

## Usage

```bash
git clone https://github.com/apwiggins/proxmox-terraform-k3s-ansible-cluster.git
terraform init
terraform plan -out plan.out
terraform apply plan.out
# show the vmids, ip addresses and root passwords
terraform output nodes
./build_cluster.sh
```
NOTE: something is broken in the terraform as ssh in terraform seems to have stopped working.  Can still ssh root@node to any node, but not within the normal terraform flow.  A helper script 'build_cluster.sh' has been added to run the ansible playbook.


## Adding config for kubectl

1. Copy `config` to `~/.kube/config` OR

2. Merge `config` with your existing ~/.kube/config:


```bash
export KUBECONFIG=~/.kube/config:~/someotherconfig 
kubectl config view --flatten  > ~/.kube/config
```

## Example librespeed app with Ingress to test your cluster

At stacks/librespeed, an example with template bash scripts has been created to deploy the librespeed app into its own namespace.  The librespeed app is pulled from the k8s-at-home helm chart repository with an intermediate step to adjust chart values to suit your setup.

[stacks/librespeed](https://github.com/apwiggins/proxmox-terraform-k3s-ansible-cluster/tree/master/stacks/librespeed)
