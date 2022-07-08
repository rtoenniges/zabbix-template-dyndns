#!/bin/sh

ZABBIX_SERVER=<hostname or IP of zabbix server>
ZABBIX_HOST=<name of host in zabbix>
VALIDIP_V6='^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$'

wan_ipv4=`curl https://api.ipify.org/?format=plain --retry 3` &&
wan_ipv6=`curl https://api64.ipify.org/?format=plain --retry 3` &&

zabbix_sender -z $ZABBIX_SERVER -s "$ZABBIX_HOST" -k WAN.IPv4.address -o $wan_ipv4 &&

if [[ $wan_ipv6 =~ $VALIDIP_V6 ]]; then
   zabbix_sender -z $ZABBIX_SERVER -s "$ZABBIX_HOST" -k WAN.IPv6.address -o $wan_ipv6 
fi

