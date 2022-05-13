#!/usr/bin/env bash

if [ ! -d "roles" ]; then
    mkdir roles
    ln -s ../.. roles/matildapeak.garten
fi

ansible-playbook site.yml -e state=absent

kubectl delete namespace/garten
