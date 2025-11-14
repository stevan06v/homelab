# Static IPv4 Configuration (DHCPCD)

## Install DHCPCD
```sh
sudo apt-get install dhcpcd
```

## Using DHCPCD 

Raspbian the DHCP Client Daemon (DHCPCD) by default. Static IPv4 configuration should be done through the file `/etc/dhcpcd.conf`.

### 1. Check if DHCPCD is running

```sh
sudo service dhcpcd status
```

If it is installed but disabled, start and enable it:

```sh
sudo service dhcpcd start
sudo systemctl enable dhcpcd
```

### 2. Restore default `/etc/network/interfaces` settings

Interfaces should use:

```sf
iface <interface> manual
```

This ensures DHCPCD manages them.

### 3. Configure static IPv4 in `/etc/dhcpcd.conf`

Open the configuration file:

```
sudo nano /etc/dhcpcd.conf
```

Add an example configuration:

```
interface eth0
static ip_address=192.168.1.2/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```

Ensure the chosen IP address:

* is not already in use
* is outside the DHCP server’s pool
* matches your network’s subnet and router settings


### 4. Apply the configuration

Recommended when connected via SSH:

```
sudo reboot
```

Alternative (not recommended over SSH):

```sh
sudo service networking restart
```

Or restart interface locally:

```sh
sudo ifdown eth0
sudo ifup eth0
```

---

## Excluding or Allowing Interfaces in DHCPCD

You can tell DHCPCD to ignore or explicitly manage certain interfaces.

Edit the configuration:

```sh
sudo nano /etc/dhcpcd.conf
```

### Exclude interface:

```sh
denyinterfaces eth0
```

Network configuration for this interface must then be done in `/etc/network/interfaces`.

### Allow interface explicitly:

```sh
allowinterfaces eth0
```

Save and exit:
`Strg + O`, `Return`, `Strg + X`

### Apply changes

```sh
sudo reboot
```

or locally (not over SSH):

```sh
sudo service networking restart
sudo ifdown eth0
sudo ifup eth0
```
