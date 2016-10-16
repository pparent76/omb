#!/bin/bash -xe

cd /root/
git clone https://github.com/pparent76/Omb-ihm.git
cd Omb-ihm
# Get specific revision in order to have reproducible results
git reset --hard e2943286bbb10525ebfaf203f9d3e2b5ad7a154b
make

cd /root/
git clone https://github.com/pparent76/Omb-cs-com.git
cd Omb-cs-com/client/
# Get specific revision in order to have reproducible results
git reset --hard 664e581912222c9715bc2c9fc9219138527f5d0e
make && make install

cd /root/
git clone https://github.com/pparent76/ttdnsd.git
cd ttdnsd
# Get specific revision in order to have reproducible results
git reset --hard b9be844df3b6e061a37f00f431c65c0416091730
make install
