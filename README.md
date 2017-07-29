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
