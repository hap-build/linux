#!/bin/bash
set -eu
export DEBIAN_FRONTEND=noninteractive

echo "Installing packages"
apt-get -y -qq update
apt-get -y -q install ntp

echo "Updating NTP to pool.ntp.org"
cat > /etc/ntp.conf <<"EOF"
server 0.pool.ntp.org
server 1.pool.ntp.org
server 2.pool.ntp.org
server 3.pool.ntp.org
EOF

echo "Setting timezone to UTC"
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

echo "Restarting NTP"
service ntp restart
