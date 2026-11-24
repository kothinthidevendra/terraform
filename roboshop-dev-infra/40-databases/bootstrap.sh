#!/bin/bash

dnf install ansible -y
cd /home/ec2-user
git clone https://github.com:kothinthidevendra/project1-ansible-v3.git
cd project1-ansible-v3
git pull # when you are running for 2nd time, you need to pull the latest changes from git repo
ansible-playbook -e component=mongodb main.yaml

