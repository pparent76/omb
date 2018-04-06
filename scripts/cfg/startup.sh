#!/bin/bash


source /host/settings.sh

set -e

cp $APP_DIR/src/startup-scripts/ttdnsd-survey.sh /etc/
cp $APP_DIR/src/startup-scripts/tor-survey.sh /etc/
cp $APP_DIR/src/startup-scripts/rc.local /etc/
chmod +x /etc/ttdnsd-survey.sh
chmod +x /etc/tor-survey.sh
chmod +x /etc/rc.local

#Replace MASTER_DOMAIN
sed -i "s/MASTER_DOMAIN/$MASTER_DOMAIN/g"  /etc/tor-survey.sh

exit 0
