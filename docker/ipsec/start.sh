#!/bin/bash

set -e

echo "======================================"
echo " Starting IPsec node: $HOSTNAME"
echo "======================================"

ip link set lo up

# Route to the protected network behind the remote VPN peer
if [ -n "$REMOTE_PROTECTED_NET" ] && [ -n "$REMOTE_WAN_IP" ]; then
    ip route replace "$REMOTE_PROTECTED_NET" via "$REMOTE_WAN_IP" || true
fi

# HQ only: the APP network 192.168.10.0/24 sits behind the firewall (192.168.60.2)
if [ -n "$LOCAL_PROTECTED_NET" ] && [ -n "$LOCAL_NEXT_HOP" ]; then
    ip route replace "$LOCAL_PROTECTED_NET" via "$LOCAL_NEXT_HOP"
fi

echo
echo "[IP ADDRESSES]"
ip -br addr

echo
echo "[ROUTING TABLE]"
ip route

echo
echo "[START STRONGSWAN]"
ipsec start

tail -f /dev/null

