#!/bin/bash


echo "=== DNS Server Dashboard ==="
echo "Current Status: $(date)"
echo ""


LASTEST_LOG=$(ls -t ~/dns-homelab-project/monitoring/logs/ | head -1)
echo "Latest Health Check Results:"
tail -10 ~/dns-homelab-project/monitoring/logs/$LATEST_LOG

echo ""
echo "=== Recent Reports ==="
ls -lt ~/dns-homelab-project/monitoring/reports/ | head -5

