# zabbix-template-dyndns
Zabbix template to check dynamic dns by monitor WAN and domain IP

/etc/zabbix/zabbix_agentd.d/
- domain_ipv4.conf
- domain_ipv6.conf
 
/etc/zabbix
- send_ip.sh
 
crontab -e
# Send public IP to Zabbix (every minute)
* * * * * /etc/zabbix/send_ip.sh
