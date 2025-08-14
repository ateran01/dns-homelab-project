
# DNS Server Homelab Project


## Overview 
Complete DNS infrastructure setup using BIND9 on Unbuntu Server, demonstrating network admin skills through hands-on DNS configuration, zone management, and troubleshooting.

## Skills Demonstrated
- **DNS Server Configuration**: BIND9 installation and setup
- ** Zone Mangentment**: Forward and reverse DNS zones 
- **Custom Monitoring**: Bash scripting for automated health checks
- **Network Troubleshooting**: Systemtic problem-solving approach
- **Documentation**: Comprehensive guides and troubleshooting procedures
- **Linux Administration**: Ubuntu server managenment and services 

## Architecture
- **Primary DNS Server**: Ubuntu 20.04 LTS
- **Domain**: homelab.local
- **Network**: 192.168.1.0/24
- **Services**: Web, Mail, FTP, DNS

## Monitoring System

### Manual Health Checks
- Custom monitoring script vaildates all DNS functions 
- Forward/Reverse lookup testing 
- External DNS forwarding vaildation 
- BIND9 service status monitoring 
- DNS response time measurement

### Features
- Comprehensive DNS health validation 
- Professional logging with timestamps 
- HTML report generation 
- Response time monitoring 
- Service availability checks

## Usage
```bash
# Run comprehemsive DNS health check
./monitoring/scripts/dns-monitor.sh

# View monitoring dashboard
./monitoring/scripts/dashboard.sh


## Project Files 
- `configs/` - BIND9 configuration files 
- `docs/` - Installation and troubleshooting guides
- `monitoring/`
- Zone files for homelab.local domain

## Quick Start 
1. Follow installation guide in `docs/installation-guide.md`
2. configure zones using provided config files 
3. Test DNS resolution 

## Technologies Used 
- BIND9 DNS Server 
- Unbuntu Linux
- Virtual Machine environment
- Git version control 

