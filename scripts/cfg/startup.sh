#!/bin/bash -x

source /host/settings.sh

cp $APP_DIR/src/startup-scripts/ttdnsd-survey.sh /usr/local/sbin/
chmod +x /usr/local/sbin/ttdnsd-survey.sh

cp $APP_DIR/src/startup-scripts/tor-survey.sh /usr/local/sbin/
sed -i /usr/local/sbin/tor-survey.sh \
    -e "s/proxy.omb.one/$PROXY/g"
chmod +x /usr/local/sbin/tor-survey.sh

cp $APP_DIR/src/startup-scripts/rc.local /etc/
chmod +x /etc/rc.local
