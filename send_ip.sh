#!/bin/sh

VALIDIP_V6='^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$'

wan_ipv4=`curl https://api.ipify.org/?format=plain --retry 3` &&
#wan_ipv6=`/usr/sbin/ip -o -6 addr list ens18 | awk '{print $4}' | awk 'NR==2' | cut -d/ -f1` &&
wan_ipv6=`curl https://api64.ipify.org/?format=plain --retry 3` &&

zabbix_sender -z zabbix.server -s "hostname" -k WAN.IPv4.address -o $wan_ipv4 &&

# Da ipfy manchmal die IPv4 anstelle der IPv6 schickt -> Nochmal prüfen
if [[ $wan_ipv6 =~ $VALIDIP_V6 ]]; then
   zabbix_sender -z zabbix.server -s "hostname" -k WAN.IPv6.address -o $wan_ipv6 
fi

