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

The state of the used roles:

|Role name|GitHub Action|GitLab CI|Version|
|---------|-------------|---------|-------|
|[apt_autostart](https://galaxy.ansible.com/robertdebock/apt_autostart)|[![github](https://github.com/robertdebock/ansible-role-apt_autostart/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-apt_autostart/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-apt_autostart/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-apt_autostart)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-apt_autostart/latest.svg)](https://github.com/robertdebock/ansible-role-apt_autostart/releases)|
|[bootstrap](https://galaxy.ansible.com/robertdebock/bootstrap)|[![github](https://github.com/robertdebock/ansible-role-bootstrap/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-bootstrap/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-bootstrap/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-bootstrap)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-bootstrap/latest.svg)](https://github.com/robertdebock/ansible-role-bootstrap/releases)|
|[buildtools](https://galaxy.ansible.com/robertdebock/buildtools)|[![github](https://github.com/robertdebock/ansible-role-buildtools/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-buildtools/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-buildtools/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-buildtools)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-buildtools/latest.svg)](https://github.com/robertdebock/ansible-role-buildtools/releases)|
|[ca_certificates](https://galaxy.ansible.com/robertdebock/ca_certificates)|[![github](https://github.com/robertdebock/ansible-role-ca_certificates/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-ca_certificates/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-ca_certificates/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-ca_certificates)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-ca_certificates/latest.svg)](https://github.com/robertdebock/ansible-role-ca_certificates/releases)|
|[certbot](https://galaxy.ansible.com/robertdebock/certbot)|[![github](https://github.com/robertdebock/ansible-role-certbot/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-certbot/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-certbot/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-certbot)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-certbot/latest.svg)](https://github.com/robertdebock/ansible-role-certbot/releases)|
|[cron](https://galaxy.ansible.com/robertdebock/cron)|[![github](https://github.com/robertdebock/ansible-role-cron/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-cron/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-cron/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-cron)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-cron/latest.svg)](https://github.com/robertdebock/ansible-role-cron/releases)|
|[digitalocean-agent](https://galaxy.ansible.com/robertdebock/digitalocean-agent)|[![github](https://github.com/robertdebock/ansible-role-digitalocean-agent/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-digitalocean-agent/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-digitalocean-agent/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-digitalocean-agent)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-digitalocean-agent/latest.svg)](https://github.com/robertdebock/ansible-role-digitalocean-agent/releases)|
|[epel](https://galaxy.ansible.com/robertdebock/epel)|[![github](https://github.com/robertdebock/ansible-role-epel/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-epel/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-epel/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-epel)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-epel/latest.svg)](https://github.com/robertdebock/ansible-role-epel/releases)|
|[fail2ban](https://galaxy.ansible.com/robertdebock/fail2ban)|[![github](https://github.com/robertdebock/ansible-role-fail2ban/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-fail2ban/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-fail2ban/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-fail2ban)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-fail2ban/latest.svg)](https://github.com/robertdebock/ansible-role-fail2ban/releases)|
|[firewall](https://galaxy.ansible.com/robertdebock/firewall)|[![github](https://github.com/robertdebock/ansible-role-firewall/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-firewall/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-firewall/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-firewall)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-firewall/latest.svg)](https://github.com/robertdebock/ansible-role-firewall/releases)|
|[httpd](https://galaxy.ansible.com/robertdebock/httpd)|[![github](https://github.com/robertdebock/ansible-role-httpd/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-httpd/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-httpd/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-httpd)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-httpd/latest.svg)](https://github.com/robertdebock/ansible-role-httpd/releases)|
|[openssl](https://galaxy.ansible.com/robertdebock/openssl)|[![github](https://github.com/robertdebock/ansible-role-openssl/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-openssl/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-openssl/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-openssl)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-openssl/latest.svg)](https://github.com/robertdebock/ansible-role-openssl/releases)|
|[python_pip](https://galaxy.ansible.com/robertdebock/python_pip)|[![github](https://github.com/robertdebock/ansible-role-python_pip/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-python_pip/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-python_pip/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-python_pip)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-python_pip/latest.svg)](https://github.com/robertdebock/ansible-role-python_pip/releases)|
|[selinux](https://galaxy.ansible.com/robertdebock/selinux)|[![github](https://github.com/robertdebock/ansible-role-selinux/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-selinux/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-selinux/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-selinux)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-selinux/latest.svg)](https://github.com/robertdebock/ansible-role-selinux/releases)|
|[update](https://galaxy.ansible.com/robertdebock/update)|[![github](https://github.com/robertdebock/ansible-role-update/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-update/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-update/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-update)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-update/latest.svg)](https://github.com/robertdebock/ansible-role-update/releases)|

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
