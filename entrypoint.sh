#!/usr/bin/env bash
set -e

docker compose \
  -f traefik/docker-compose.yaml \
  -f pihole/docker-compose.yaml \
  -f nginx/docker-compose.yaml \
  -f wgeasy/docker-compose.yaml \
  up -d