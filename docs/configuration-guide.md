# Configuration Guide 

## Zone Configuration Files 

### Forward Zone (db.homelab.local)
- Maps hostnames to IP addresses 
- Contains A records for web, mail, ftp services 
- SOA record defines zone authority 

### Reverse Zone (db.192.168.1) 
- Maps IP addresses back to hostnames 
- Contains PTR records for reverse lookups 
- Essential for proper DNS funnctionality 

## Testing Configuration 
```bash 
sudo named-checkzone homelab.local /etc/bind/zones/db.homelab.local
sudo named-checkzone 1.168.192.in-addr.arpa /etc/bind/zones/db.192.168.1
sudo systemctl restart bind9 
