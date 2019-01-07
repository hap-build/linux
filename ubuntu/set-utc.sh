#!/bin/bash
set -eu
export DEBIAN_FRONTEND=noninteractive

if [ -f /etc/ntp.conf ]; then
	echo "NTP installed"
	date
	exit 0
fi

echo "Installing NTP packages"
apt-get -y -qq update
apt-get -y -q install ntp ntpstat

echo "Updating NTP to pool.ntp.org"
cat >/etc/ntp.conf <<"EOF"
server 0.pool.ntp.org
server 1.pool.ntp.org
server 2.pool.ntp.org
server 3.pool.ntp.org
EOF

echo "Setting timezone to UTC"
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

echo "Restarting NTP"
service ntp restart
