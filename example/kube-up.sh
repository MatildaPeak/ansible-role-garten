#!/usr/bin/env bash

# Run from a Python virtual environment...
#
#   python -m venv venv
#   source venv/bin/activate
#   pip install -r requirements.txt

if [ ! -d "roles" ]; then
    mkdir roles
    ln -s ../.. roles/matildapeak.garten
fi

kubectl create -f namespace.yml
kubectl config set-context --current --namespace=garten

ansible-playbook site.yaml
