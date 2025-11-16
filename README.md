# Homelab Setup

This repository contains the full configuration of my self-hosted homelab environment.
Everything runs on a Raspberry Pi using Docker and Traefik as the central entrypoint and reverse proxy.

The homelab can be accessed through:


[https://traefik.stevan.sexidude.com](https://traefik.stevan.sexidude.com)


Traefik handles TLS certificates (Let’s Encrypt), routing, and secure access to all internal services.

---

## Overview

The homelab consists of several services, each isolated in its own folder with a dedicated `docker-compose.yaml` file. A root compose file orchestrates all services using `extends`.

---

## Services

### Traefik

Reverse proxy and entrypoint into the homelab.
Provides automatic HTTPS, routing, dashboards, and middlewares.

Accessible at:

[https://traefik.stevan.sexidude.com](https://traefik.stevan.sexidude.com)

### Pi-hole

Network-wide DNS filtering and ad blocking.
Used as the LAN DNS server and routed through Traefik.

Accessible at:

[https://pihole.stevan.sexidude.com](https://pihole.stevan.sexidude.com)

### Nginx (Static Site)

Serves a simple static landing page for testing and internal use.

Accessible at:

[https://homelab.stevan.sexidude.com](https://homelab.stevan.sexidude.com)

### WireGuard (wg-easy)

Web UI and configuration portal for WireGuard VPN.

Accessible at:

[https://vpn.stevan.sexidude.com](https://vpn.stevan.sexidude.com)

---

## Starting the Entire Homelab

From the project root:

```sh
docker compose up -d
```

This loads and starts all service stacks using the root compose file.

---

## Stopping the Entire Homelab

```sh
docker compose up down
```

---

## Networking

A shared custom Docker network is used:

```
traefik_network
```

If some issues appear when it comes to the network just run:
```sh
docker network create traefik_network
```


All services attach to this network so Traefik can route traffic internally without exposing service ports to the host.

---

## DNS Setup

The router is configured to use Pi-hole as the primary DNS server:

```
Primary DNS: 192.168.0.223
Secondary DNS: 8.8.8.8
```

Devices on the LAN resolve DNS through Pi-hole automatically.

---

## SSL Certificates

Traefik uses Let’s Encrypt with the `http` challenge to automatically issue certificates for all subdomains:

* traefik.stevan.sexidude.com
* pihole.stevan.sexidude.com
* homelab.stevan.sexidude.com
* vpn.stevan.sexidude.com

Certificates are stored in `traefik/letsencrypt/acme.json`.


