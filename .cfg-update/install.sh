#!/bin/env bash

set -e

if [ ! -d modules ]
then
    git clone https://github.com/kewlfft/ansible-aur.git modules/aur
    git clone https://github.com/ewok/ansible-pacman-key.git modules/pacman_key
fi

if [ ! -d .venv ];then
    virtualenv -p python3 .venv
fi
source .venv/bin/activate
pip install ansible

TAGS=${1:-"pre,base,editor"}
ansible-playbook install.yaml -D -K -t "$TAGS"
