#!/bin/bash

set -e

echo "======================================"
echo " Starting FIREWALL"
echo "======================================"

# Branch LAN is reached through HQ-IPSEC
ip route replace 192.168.20.0/24 via 192.168.60.1

# WireGuard client subnet is reached through WG-GW
ip route replace 10.50.0.0/24 via 192.168.70.1

# Default route towards WAN
ip route replace default via 172.16.0.254 || true

echo
echo "[FIREWALL IP ADDRESSES]"
ip -br addr

echo
echo "[FIREWALL ROUTING TABLE]"
ip route

echo
echo "[LOAD NFTABLES]"
nft -f /etc/nftables.conf

echo
echo "[NFTABLES RULESET]"
nft list ruleset

echo
echo "Firewall ready."

tail -f /dev/null
