#!/bin/bash
yum -y update
yum -y install epel-release
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
yum repolist
yum -y --enablerepo=epel install ansible python-pip python-wheel
pip install boto3
#cloud-config
password: [meuovo]
chpasswd: { expire: False }
ssh_pwauth: True
PermitRootLogin yes
RSAAuthentication yes
reboot
