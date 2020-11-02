#!/bin/bash
#
# Setup returnco.de port re-direction
#
# sudo chmod 744 /etc/lighttpd/returnco-de-firewall.sh
# sudo chown root.root /etc/lighttpd/returnco-de-firewall.sh
#

PORT=200
while [  "$PORT" -lt 1000 ]; do
	if [ "$PORT" -ne 443 ]; then
		iptables -t nat -I PREROUTING --dst 81.169.220.22 -p tcp \
			--dport "$PORT" \
			-j REDIRECT --to-port 80
	fi
	let PORT=PORT+1 
done

echo "iptables initialized" >> /var/log/firewall.log

# iptables --flush -t nat
# iptables -t nat -L -n -v
