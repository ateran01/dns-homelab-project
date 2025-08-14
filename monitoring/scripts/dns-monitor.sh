#!/bin/bash


LOG_DIR="/home/$USER/dns-homelab-project/monitoring/logs"
REPORT_DIR="/home/$USER/dns-homelab-project/monitoring/reports"
DATE=$(date '+%Y-%m-%d')
TIME=$(date '+%H:%M:%S')
LOGFILE="$LOG_DIR/dns-monitor-$DATE.log"

mkdir -p $LOG_DIR $REPORT_DIR

echo "=========================================" | tee -a $LOGFILE
echo "DNS Health Check Report - $DATE $TIME" | tee -a $LOGFILE
echo "=========================================" | tee -a $LOGFILE


echo "1. Testing Forward DNS Resolution..." | tee -a $LOGFILE
if dig @localhost web.homelab.local +short | grep -q "192.168.1.20"; then
    echo "  * PASS: web.homelab.local -> 192.168.1.20" | tee -a $LOGFILE
    FORWARD_STATUS="PASS"
else
    echo "  x FAIL: Forward lookup failed" | tee -a $LOGFILE
    FORWARD_STATUS="FAIL"
fi


echo "2. Testing Reverse DNS Resolution..." | tee -a $LOGFILE
if dig @localhost -x 192.168.1.20 +short | grep -q "web.homelab.local"; then
    echo "   * PASS: 192.168.1.20 -> web.homelab.local" | tee -a $LOGFILE
    REVERSE_STATUS="PASS"
else
    echo "   x FAIL: Reverse lookup failed" | tee -a $LOGFILE
    REVERSE_STATUS="FAIL"
fi


echo "3. Testing External DNS Forwarding..." | tee -a $LOGFILE
if dig @localhost google.com +short | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' > /dev/null; then
    echo "    * PASS: External DNS forwarding working" | tee -a $LOGFILE
    EXTERNAL_STATUS="PASS"
else
    echo "    x FAIL: EXTERNAL DNS forwarding failed" | tee -a $LOGFILE
fi


echo "4. Testing BIND9 Service Status..." | tee -a $LOGFILE
if systemctl is-active --quiet bind9; then
    echo "   * PASS: BIND9 service is running" | tee -a $LOGFILE
    SERVICE_STATUS="PASS"
else
    echo "   x FAIL: BIND9 service is not running" | tee -a $LOGFILE
    SERVICE_STATUS="FAIL"
fi


echo "5. Testing DNS Response Time..." | tee -a $LOGFILE
RESPONSE_TIME=$(dig @localhost web.homelab.local | grep "Query time" | awk '{print $4}')
if [ ! -z "$RESPONSE_TIME" ]; then
    echo "   * Response Time: ${RESPONSE_TIME}ms" | tee -a $LOGFILE
else
    echo "   x Could not measure response time" | tee -a $LOGFILE
fi


echo "========================================" | tee -a $LOGFILE
echo "SUMMARY REPORT" | tee -a $LOGFILE
echo "Forward DNS:	$FORWARD_STATUS" | tee -a $LOGFILE
echo "Reverse DNS:	$REVERSE_STATUS" | tee -a $LOGFILE
echo "External Forward: $EXTERNAL_STATUS" | tee -a $LOGFILE
echo "BIND9 Service:	$SERVICE_STATUS" | tee -a $LOGFILE
echo "Response Time:	${RESPONSE_TIME}ms" | tee -a $LOGFILE
echo "========================================" | tee -a $LOGFILE


cat > $REPORT_DIR/dns-status-$DATE.html << EOF
<!DOCTYPE html>
<html><head><title>DNS Monitorting Report</title></head>
<body>
<h1>DNS Server Health Report - $DATE</h1>
<table border="1">
<tr><th>Test</th><th>Status</th></tr>
<tr><td>Forward DNS</td><td>$FORWARD_STATUS</td></tr>
<tr><td>Reverse DNS</td><td>$REVERSE_STATUS</td></tr>
<tr><td>External Forwarding</td><td>$EXTERNAL_STATUS</td></tr>
<tr><td>BIND9 Service</td><td>$SERVICE_STATUS</td></tr>
<tr><td>Response Time</td><td>${RESPONSE_TIME}ms</td></tr>
</table>
</body></html>
EOF

echo "Report saved to: $REPORT_DIR/dns-status-$DATE.html"

