#!/bin/bash

FILE=/etc/environment

usage() {
	echo "VAR=VALUE should be first param. Example: PG_DSN=\"pg://user:password@host?sslmode=disable\""
}

PAIR=$1
if [ -z "$PAIR" ]; then
	usage
	exit 1
fi
touch $FILE

VAR=$(echo "$PAIR" | cut -d= -f1)
if [ -z "$VAR" ]; then
	echo "ERROR: Please supply a valid variable."
	echo
	usage
	exit 1
fi

VALUE=$(echo "$PAIR" | cut -d= -f2-)
if [ -z "$VALUE" ]; then
  echo "ERROR: Please supply a valid value."
  echo
  usage
  exit 1
fi

if ! grep -q "$VAR" $FILE; then
	echo "Adding $VAR"
	echo "$VAR=\"$VALUE\"" >> $FILE
else
	echo "Updating $VAR with $VALUE"
	perl -pi -e "s|^$VAR=.*\n||" $FILE
	echo "$VAR=\"$VALUE\"" >> $FILE
fi
