#!/bin/bash -x
### Install the same packages as Dockerfile.

### Update and upgrade and install some other packages.
apt update
apt -y upgrade
apt -y install apt-utils apt-transport-https
apt -y remove resolvconf openresolv network-manager
apt -y install rsyslog logrotate logwatch ssmtp

### Install mariadb.
apt -y install software-properties-common
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.utexas.edu/mariadb/repo/10.2/ubuntu xenial main'
apt update
DEBIAN_FRONTEND=noninteractive \
    apt -y install mariadb-server mariadb-client

### Install packages required by own-mailbox.
DEBIAN_FRONTEND=noninteractive \
    apt -y install \
        apache2 build-essential curl dnsutils git gnupg \
        iptables iptables-persistent libcurl4-openssl-dev \
        libjpeg-dev libxml2-dev libxslt1-dev ntpdate \
        openssh-server openssl postfix postfix-mysql \
        postfix-pcre procmail python-dev python-jinja2 python-lxml \
        python-pgpdump python-pip python-virtualenv rsyslog \
        spambayes sudo tor torsocks wget zlib1g-dev
