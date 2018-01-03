#!/bin/bash -x

source /host/settings.sh

echo "own-mailbox" > /etc/hostname
echo "127.0.0.1 own-mailbox" >> /etc/hosts

mkdir -p /home/www-data/
chown www-data /home/www-data

rm -rf /etc/omb/*
mkdir -p /etc/omb/
chown www-data /etc/omb/
echo "nameserver 127.0.0.1" > /etc/resolv.conf.head

# Temporarily use google dns server and flush iptables
# to make sure the upgrade will be overwritten at first startup
echo "nameserver 8.8.8.8" > /etc/resolv.conf
iptables -F
ip6tables -F
apt-get upgrade -y

# Make sure to fetch time every hour in the crontab
(crontab -l 2>/dev/null; echo "00 * * * * service ntp stop; ntpdate -s ntp.univ-lyon1.fr; service ntp start") | crontab -

# Make sure to sync every minute
(crontab -l 2>/dev/null; echo "* * * * * sync") | crontab -

### install rng-tools
[[ $INSTALL_RNG_TOOLS == 'yes' ]] && apt-get install rng-tools
