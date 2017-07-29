#! /bin/bash

# Create subnet 'public' with parent interface 'ens33'
# and hand out IPs from network 10.0.7.192/27


docker network create -d macvlan \
    --subnet=10.0.7.0/24 \
    --gateway=10.0.7.1  \
    --ip-range=10.0.7.192/27 \
    -o parent=ens33 public
