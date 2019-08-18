#!/usr/bin/env bash

if [ ! -d "roles" ]; then
    mkdir roles
    ln -s ../.. roles/matildapeak.garten
fi

ansible-playbook site.yml \
    -e state=absent \
    -e tfl_app_id=${TFL_APP_ID} \
    -e tfl_app_key=${TFL_APP_KEY}

kubectl delete namespace/garten
