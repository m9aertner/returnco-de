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
		iptables -t nat -I PREROUTING --dst 87.106.77.12 -p tcp \
			--dport "$PORT" \
			-j REDIRECT --to-port 80
		ip6tables -t nat -A PREROUTING -p tcp -m tcp \
			-d 2a01:239:436:5400::1 \
			--dport "$PORT" \
			-j REDIRECT --to-ports 80
	fi
	let PORT=PORT+1 
done

echo "$(date --iso-8601=seconds) iptables initialized" >> /var/log/firewall.log

# iptables --flush -t nat
# iptables -t nat -L -n -v
