# vpnc

- Ubuntu 16.04 base image
- Cisco-compatible VPN client
- net.ipv4.ip_forward
- iptables w/ rules for masquerading

## Environment Variables

- `VPNC_GATEWAY`: IP/name of your IPSec gateway
- `VPNC_ID`: Group name
- `VPNC_AUTHMODE`: IKE authentication mode (hybrid, psk)
- `VPNC_SECRET`: Group password
- `VPNC_USERNAME`: XAUTH username
- `VPNC_PASSWORD`: XAUTH password

## Example config

You can find an example configuration in the docker-compose.yml included. In order for this to work, the container needs its own IP address. Create a network called `public` like this:

```
docker network create -d macvlan \
  --subnet=192.168.1.0/24 \
  --gateway=192.168.1.1  \
  --ip-range=192.168.1.2/32 \
  -o parent=eth0 public
```

Now you can assign an IP to your container:

```
version: '2'
services:
  app:
    image: janwer/vpnc-relay
    restart: always
    env_file:
     - vpnc-credentials.env
    cap_add:
     - NET_ADMIN
    networks:
      public:
        ipv4_address: 192.168.1.2

networks:
   public:
    external: true
```
