#!/bin/bash -xe

./cleanup.sh
./required-packages.sh
./setup-apache.sh

#cp docker-files/postfix /etc/init.d/postfix
cd Local_postfix_conf
make install
cd ..

./install-repositories.sh
./make-users.sh
./setup-startup.sh

./setup-rng-tool.sh

./setup-hostname.sh

#pkill python2
su mailpile -c ./setup-mailpile.sh

pip install -r /home/mailpile/Mailpile/requirements.txt

mkdir /etc/omb/
chown www-data /etc/omb/
echo "nameserver 127.0.0.1" > /etc/resolv.conf.head

cp torrc /etc/tor/torrc
touch /var/log/tor.log
chown tor /var/log/tor.log
echo "AllowInbound 1" >> /etc/tor/torsocks.conf

./setup-iptables.sh

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

if [[ -z $container ]]; then
  echo "Rebooting in 5 seconds..."
  sleep 5
  reboot
fi
