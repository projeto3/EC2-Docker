#!/bin/bash
yum -y update
yum -y install epel-release
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
yum repolist
yum -y --enablerepo=epel install ansible python-pip python-wheel
pip install boto3
sudo chmod og-rwx /mnt/recovery/home/ec2-user
#cloud-config
password: [meuovo]
chpasswd: { expire: False }
ssh_pwauth: True
