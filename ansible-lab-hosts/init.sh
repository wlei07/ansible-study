#!/bin/bash
set -e

apt-get update
apt-get install -y openssh-server sudo python3 apt-utils

# Create a user for Ansible
useradd -m -s /bin/bash ansible
echo "ansible:ansible" | chpasswd
echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# SSH config
mkdir -p /var/run/sshd
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

exec /usr/sbin/sshd -D
