# Ansible playbook Terraform

This is an experiment to see how Ansible and Terraform can work together.

In this experiment, Ansible calls Terraform, saves the hosts into an in-memory inventory and runs Ansible to those hosts.

```
+--- playbook.yml ----+
| - run terraform     |
| - save hostnames    |
| - run Ansible roles |
+---------------------+
```

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
