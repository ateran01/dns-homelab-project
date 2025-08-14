# DNS Monitoring System

## Overview
Custom monitoring solution for BIND9 DNS server with automated health checks and reporting.

## Features
- Forward/Reverse DNS testing
- External forwarding validation
- Service status monitoring
- Response time measurement
- HTML report generation 
- Automated scheduling

## Usage
- Manual check: `./scripts/dns-monitor.sh`
- View dashboard: `./scripts/dashboard.sh`
- Reports stored in: `reports/`
- Logs stored in : `logs/`

## Automated Monitoring
Runs every 15 minutues via cron job for continous monitoring. 
