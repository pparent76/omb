#!/bin/bash -xe

cd /root/
git clone --branch alpha https://github.com/Own-Mailbox/ihm
cd ihm
make

cd /root/
git clone https://github.com/Own-Mailbox/cs-com
cd cs-com/client/
# Get specific revision in order to have reproducible results
git reset --hard 664e581912222c9715bc2c9fc9219138527f5d0e
make && make install

cd /root/
git clone --branch alpha https://github.com/Own-Mailbox/ttdnsd
cd ttdnsd
make install
