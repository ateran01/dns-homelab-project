# DNS Server Troubleshooting Guide 

## Common Issues and Solutions 

### Issue: SERVFAIL Response
- **Problem**: 'nslookup' returns SERVFAIL
- **Cause**: Zone file systax errors 
- **Solution**: Run ' sudo named-checkzone homelab.local /etc/bind/zones/db.homelab.local'


### Issue: Service Won't Start
- **Problem**: 'systemctl enable bind9' fails
- **Cause**: Service name confusion or corrupted service file 
- **Solution**: Try 'systemctl list-unit-files | grep bind' to find correct service name 


### Issue: Zone Not Loading 
- **Problem**: DNS queries fail for custom domain
- **Cause**: Zone not properly defined in named.conf.local 
- **Solution**: Verify zone configuration and restart service


### Validation Commands
```bash
sudo named-checkconf			# Check main config
sudo named-checkzone domain /path/to/zone  # Check zone syntax 
sudo systemctl status bind9 		# Check services status 
 

 
