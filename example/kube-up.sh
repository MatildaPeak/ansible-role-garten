#!/usr/bin/env bash

if [ ! -d "roles" ]; then
    mkdir roles
    ln -s ../.. roles/matildapeak.garten
fi

kubectl create -f namespace.yml
kubectl config set-context --current --namespace=garten

ansible-playbook site.yml \
    -e tfl_app_id=${TFL_APP_ID} \
    -e tfl_app_key=${TFL_APP_KEY}
