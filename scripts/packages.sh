#!/bin/bash -x
### Install the same packages as Dockerfile.

#################################################
#	Install debian packages required for omb
#################################################

set -e


apt-get update

apt-get install -y apt-utils apt-transport-https
apt-get remove -y resolvconf openresolv network-manager
DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 build-essential curl dnsutils git gnupg iptables iptables-persistent libcurl4-openssl-dev libjpeg-dev libxml2-dev libxslt1-dev mysql-server ntpdate openssh-server openssl postfix postfix-mysql postfix-pcre procmail python-dev python-jinja2 python-lxml python-pgpdump python-pip python-virtualenv rsyslog spambayes sudo tor torsocks wget zlib1g-dev

apt-get install -y certbot -t jessie-backports

service mysql start

exit 0
