#!/bin/bash
set -eu

VERSION="2.3"
if [ ! -z "$1" ]; then
  VERSION=$1
fi

INSTALLED=""
if [ -f "/usr/local/bin/hap" ]l then
  INSTALLED=$(hap 2>&1| grep "Version: v$VERSION")
fi

if [ -z "$INSTALLED" ]; then
echo "Installing Hap v$VERSION"
curl --silent -L https://github.com/gwoo/hap/releases/download/v2.3/hap-linux-amd64 > /usr/local/bin/hap && \
chmod +x /usr/local/bin/hap
fi
echo "Hap v$VERSION installed"
