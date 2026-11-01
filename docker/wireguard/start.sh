#!/bin/bash

set -e

echo "======================================"
echo " Starting WireGuard node: $HOSTNAME"
echo " Role: $ROLE"
echo "======================================"

ip link set lo up

# Gateway: internal zones are reachable via the firewall
if [ "$ROLE" = "gateway" ]; then

    ip route replace 192.168.10.0/24 via 192.168.70.2
    ip route replace 192.168.40.0/24 via 192.168.70.2
    ip route replace 192.168.50.0/24 via 192.168.70.2

fi

echo "[START WG0]"
wg-quick up wg0

echo
echo "[IP ADDRESSES]"
ip -br addr

echo
echo "[ROUTES]"
ip route

echo
echo "[WIREGUARD]"
wg show

tail -f /dev/null
