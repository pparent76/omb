#!/bin/bash -xe

cd /root/
git clone --branch alpha https://github.com/Own-Mailbox/ihm
cd ihm
make

cd /root/
git clone --branch alpha https://github.com/Own-Mailbox/cs-com
cd cs-com/client/
make && make install

cd /root/
git clone --branch alpha https://github.com/Own-Mailbox/ttdnsd
cd ttdnsd
make install
