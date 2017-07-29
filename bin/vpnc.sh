#!/bin/sh

# Enable IP forwarding
sysctl net.ipv4.ip_forward

# Create firewall rules
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o tun0 -j ACCEPT
iptables -A FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Create vpnc config
cat > /etc/vpnc/default.conf <<EOF
IPSec gateway ${VPNC_GATEWAY}
IPSec ID ${VPNC_ID}
IKE authmode ${VPNC_AUTHMODE}
IPSec secret ${VPNC_SECRET}
Xauth username ${VPNC_USERNAME}
Xauth password ${VPNC_PASSWORD}
DPD idle timeout (our side) 0
EOF

# Start vpnc
exec /usr/sbin/vpnc default --no-detach --non-inter --local-port 0
