# Ansible playbook Terraform

This is an experiment to see how Ansible and Terraform can work together.

In this experiment, Ansible calls Terraform, saves the hosts into an in-memory inventory and runs Ansible to those hosts.

## Setup

```
ansible-galaxy install -r roles/requirements.yml -f
cd terraform/
terraform init
cd ../
```

## Create

```shell
./playbook
```

## Destroy

```shell
cd terraform/
terraform destroy
cd ../
```
