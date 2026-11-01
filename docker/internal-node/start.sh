#!/bin/bash

set -e

echo "======================================"
echo " Starting internal node: $HOSTNAME"
echo "======================================"

# Docker sets the default gateway to .254;
# internal zones must route through the firewall (.1) instead.
if [ -n "$DEFAULT_GW" ]; then
    ip route replace default via "$DEFAULT_GW"
fi

echo
echo "[IP ADDRESS]"
ip -br addr

echo
echo "[ROUTING TABLE]"
ip route

tail -f /dev/null
