#!/bin/bash -x
### Install and configure Own-Mailbox.

cd $(dirname $0)

### install required packages
scripts/packages.sh

### install docker-scripts
#apt -y install docker-scripts
git clone https://github.com/docker-scripts/ds /opt/docker-scripts/ds
cd /opt/docker-scripts/ds/
make install
cd -

### copy settings.sh to /host/
### scripts expect to find it there
rm -rf /host
mkdir -p /host
cp settings.sh /host/

### copy the code of omb
rm -rf /opt/Own-Mailbox/omb
mkdir -p /opt/Own-Mailbox/omb
cp -a * /opt/Own-Mailbox/omb/
export APP_DIR=/opt/Own-Mailbox/omb

rm -rf /opt/docker-scripts/omb
mkdir -p /opt/docker-scripts/omb
cp -a * /opt/docker-scripts/omb/

### the configuration scripts below
### are the same as those on cmd_config

# run standard config scripts
ds run ubuntu-fixes.sh
ds run set_prompt.sh
ds run mariadb.sh
#ds run ssmtp.sh

# run custom config scripts
ds run cfg/apache2.sh
ds run cfg/postfix.sh
ds run cfg/repos.sh
ds run cfg/startup.sh
ds run cfg/mailpile.sh
ds run cfg/tor.sh
ds run cfg/iptables.sh
ds run cfg/misc.sh

# install and config extra things that help development
if [[ $DEV == 'true' ]]; then
    ds run phpmyadmin.sh
    apt -y install vim aptitude iputils-ping
fi

reboot
