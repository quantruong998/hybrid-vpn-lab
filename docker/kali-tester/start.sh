#!/bin/bash

set -e

echo "======================================"
echo " KALI TESTER (WAN)"
echo "======================================"

echo "[IP]"
ip -br addr

echo
echo "[ROUTES]"
ip route

tail -f /dev/null
