#!/bin/bash -x


sed -i /etc/tor/torsocks.conf -e '/^AllowInbound/d'
cat <<EOF >> /etc/tor/torsocks.conf
AllowInbound 1
EOF

sed -i /etc/tor/torrc -e '/^SocksPort/d'
cat <<EOF >> /etc/tor/torrc
SocksPort 9050 # Default: Bind to localhost:9050 for local connections.
EOF

# adduser --disabled-password --system --shell /bin/bash tor
# mkdir -p /var/lib/tor/
# chown -R tor /var/lib/tor/
# touch /var/log/tor.log
# chown tor /var/log/tor.log
