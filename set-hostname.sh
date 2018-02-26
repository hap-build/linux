#!/bin/bash
set -eu

HOSTNAME=$1
if [ -z "$HOSTNAME" ]; then
	echo "Please specify the hostname as the first param."
	exit 2
fi

# Customize the message of the day
echo  "Welcome to ${HOSTNAME}." > /etc/motd

echo "Setting hostname to ${HOSTNAME}"
hostname "${HOSTNAME}"
echo "${HOSTNAME}" > /etc/hostname
if ! grep -q $HOSTNAME /etc/hosts; then
	echo "127.0.0.1 ${HOSTNAME}" >> /etc/hosts
fi
if cat /etc/lsb-release | grep -q trusty; then
service hostname restart
else
hostnamectl set-hostname "${HOSTNAME}"
fi
