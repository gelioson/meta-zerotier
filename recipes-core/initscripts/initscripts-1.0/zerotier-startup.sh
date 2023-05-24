#! /bin/sh

if crontab -l | grep -q "zerotier-control"; then
	echo "ZeroTierDaemon is running";
else
	crontab -l | { cat; echo "* * * * * /usr/bin/zerotier-control.sh start"; } | crontab -
fi
