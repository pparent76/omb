FROM debian:jessie

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y apt-utils apt-transport-https
RUN apt-get remove -y resolvconf openresolv network-manager
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 build-essential curl dnsutils git gnupg iptables iptables-persistent libcurl4-openssl-dev libjpeg-dev libxml2-dev libxslt1-dev mysql-server ntpdate openssh-server openssl postfix postfix-mysql postfix-pcre procmail python-dev python-jinja2 python-lxml python-pgpdump python-pip python-virtualenv rsyslog spambayes sudo tor torsocks wget zlib1g-dev

COPY debstrap /own-mailbox/
COPY cmd/docker-fix-jessie/mysql /etc/init.d/
COPY cmd/docker-fix-jessie/postfix /etc/init.d/
RUN cd /own-mailbox/; \
