#!/bin/bash

#################################################
#	Install debian-jessie backport
#   repositories required for omb
#################################################

if ! grep "jessie-backports" /etc/apt/sources.list; then
  echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
fi

if ! grep "security.debian.org" /etc/apt/sources.list; then
  echo "deb http://security.debian.org/ jessie/updates main" >> /etc/apt/sources.list
fi

# Fetch official debian keys for Raspbian
cp $APP_DIR/misc-files/trusted.gpg.d/* /etc/apt/trusted.gpg.d/
