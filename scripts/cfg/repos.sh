#!/bin/bash -x

cd /opt/Own-Mailbox
git clone --branch alpha https://github.com/Own-Mailbox/cs-com
cd cs-com/client/
make && make install

mkdir -p /opt/Own-Mailbox
cd /opt/Own-Mailbox
git clone --branch alpha https://github.com/Own-Mailbox/ihm
cd ihm
make

cd /opt/Own-Mailbox
git clone --branch alpha https://github.com/Own-Mailbox/ttdnsd
cd ttdnsd
make install
