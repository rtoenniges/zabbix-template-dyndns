# zabbix-template-dyndns
Zabbix template to check dynamic dns by monitor WAN and domain IP

- Domain configurable via macro {$DOMAIN.NAME}
- Trigger "IPvx deprecated" fires after 10 differing values

/etc/zabbix/zabbix_agentd.d/
- domain_ipv4.conf
- domain_ipv6.conf
 
/etc/zabbix
- send_public_ip.sh
 
crontab -e
```console
# Send public IP to Zabbix (every minute)
* * * * * /etc/zabbix/send_public_ip.sh
```
