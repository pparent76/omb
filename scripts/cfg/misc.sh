#!/bin/bash

pip install -r /home/mailpile/Mailpile/requirements.txt

mkdir /etc/omb/
chown www-data /etc/omb/
echo "nameserver 127.0.0.1" > /etc/resolv.conf.head

cp $APP_DIR/src/tor/torrc /etc/tor/torrc
touch /var/log/tor.log
chown tor /var/log/tor.log

echo "AllowInbound 1" >> /etc/tor/torsocks.conf
msg_if_failed  "Error while setting up torsocks." 


# Make sure to fetch time every hour in the crontab
(crontab -l 2>/dev/null; echo "00 * * * * service ntp stop; ntpdate -s ntp.univ-lyon1.fr; service ntp start") | crontab -

# Make sure to sync every minute
(crontab -l 2>/dev/null; echo "* * * * * sync") | crontab -

# Temporarily use google dns server and flush iptables
# to make sure the upgrade will be overwritten at first startup
echo "nameserver 8.8.8.8" > /etc/resolv.conf
