#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <machine name>"
  exit 2
fi

docker-machine stop "$1"
docker-machine rm "$1"
