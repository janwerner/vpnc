#!/bin/sh

# Enable NAT, firewall rules
sysctl net.ipv4.ip_forward

# Create & save iptables
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o tun0 -j ACCEPT
iptables -A FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT
mkdir /etc/iptables
iptables-save > /etc/iptables/rules.v4