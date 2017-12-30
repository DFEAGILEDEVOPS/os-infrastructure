#!/bin/bash
DEPLOY_HOST=52.169.112.42
SSH_USER=nigel
#
# Install prereq's for AWX
ssh -t $SSH_USER@$DEPLOY_HOST "sudo yum -y install git"

ssh -t $SSH_USER@$DEPLOY_HOST "sudo yum -y install docker"

ssh -t $SSH_USER@$DEPLOY_HOST "sudo systemctl enable docker"
ssh -t $SSH_USER@$DEPLOY_HOST "sudo systemctl start docker"

ssh -t $SSH_USER@$DEPLOY_HOST "sudo yum -y install python-docker-py.noarch"

ssh -t $SSH_USER@$DEPLOY_HOST "sudo yum -y install ansible"

ssh -t $SSH_USER@$DEPLOY_HOST "git clone https://github.com/ansible/awx.git"

ssh -t $SSH_USER@$DEPLOY_HOST "sudo ansible-playbook -i /home/$SSH_USER/awx/installer/inventory /home/$SSH_USER/awx/installer/install.yml"
