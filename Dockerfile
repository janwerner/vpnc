FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y vpnc iptables iptables-persistent



# Setup iptables rules
RUN mkdir -p /etc/service/nat-iptables
COPY bin/nat-iptables.sh /etc/service/nat-iptables/run
CMD ["/etc/service/nat-iptables/run"]

# Setup vpnc service
RUN mkdir -p /etc/service/vpnc
COPY bin/vpnc.sh /etc/service/vpnc/run
CMD ["/etc/service/vpnc/run"]

# Clean up
RUN apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

