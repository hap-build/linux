#!/bin/bash
set -eu
export DEBIAN_FRONTEND=noninteractive

echo "Installing packages"
apt-get -y -qq update
apt-get -y -q install  \
  make \
  sysstat \
  atop
