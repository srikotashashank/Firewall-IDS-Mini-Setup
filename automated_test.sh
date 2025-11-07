#!/bin/bash
# Author: Srikota Shashank
# Project: Firewall + IDS Mini Setup
# Description: Automates firewall + IDS test and data collection

set -euo pipefail
OUTDIR="$HOME/firewall_ids_project/outputs"
mkdir -p "$OUTDIR"

KIFACE=$(ip -o -4 route show to default | awk '{print $5}')
TARGET="$1"
if [ -z "$TARGET" ]; then
  echo "Usage: $0 192.168.74.134"
  exit 1
fi

echo "Using interface $KIFACE targeting $TARGET"

# Capture traffic for 45 seconds
sudo timeout 45 tcpdump -i "$KIFACE" host "$TARGET" -w "$OUTDIR/attack_capture.pcap" &

# Ping + Nmap scan
ping -c 3 "$TARGET" > "$OUTDIR/ping.txt" || true
sudo nmap -sS -p 20-100 "$TARGET" -oN "$OUTDIR/nmap_syn.txt"
nmap -sV "$TARGET" -oN "$OUTDIR/nmap_service.txt"

# Copy Snort alerts and iptables rules
sudo cp /var/log/snort/alert "$OUTDIR/snort_alerts.txt" 2>/dev/null || true
sudo iptables-save > "$OUTDIR/iptables.rules" 2>/dev/null || true

echo "Automated run complete. Outputs stored in $OUTDIR"
