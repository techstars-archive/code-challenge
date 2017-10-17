#!/bin/bash

if [ -z "$DO_ACCESS_TOKEN" ]; then
  echo "No DigitalOcean access token found (should be in \$DO_ACCESS_TOKEN)"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: $0 <machine name>"
  exit 2
fi

docker-machine create \
  --driver digitalocean \
  --digitalocean-access-token "$DO_ACCESS_TOKEN" \
  --digitalocean-size 2gb \
  "$1"

docker-machine ip "$1"
