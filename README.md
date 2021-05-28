# AWS Hadoop Cluster

This is the infrastructure and configuration-as-code for setting up a Hadoop cluster in AWS.

**Note: This is not 'production-ready', and should not be used as such. There are some shortcuts taken for simplicity that would introduce security concerns in a production environment**

## Prerequisites

- An EC2 keypair created in the AWS console
    - You will need the keypair name for the Terraform plan, otherwise you won't be able to access the instances later on!
    - Store the private and public keys in the Ansible vault

## Terraform

The EC2 instances are currently spec'd as follows:
- NameNode
    - m5.xlarge
    - 64 GB gp3 root block device
- 3x DataNodes
    - m5.xlarge
    - 64 GB gp3 root block device

**Note: The security group needs modification in order for communication to work between the NameNode and DataNodes (currently it only allows SSH)**

Usage:

```bash
$ make plan
$ make apply
```

## Ansible

Replace the stubs in the hosts file with the real IP/hostname for each node resulting from the Terraform step.

No elastic IPs are configured automatically, but that would be a helpful step to add so that you can restart the instances and not have to worry about reconfiguring Hadoop every time.

Usage:

```bash
$ make install
```