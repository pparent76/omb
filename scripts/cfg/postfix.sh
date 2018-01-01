#!/bin/bash -x

#cp $APP_DIR/src/docker-files/postfix /etc/init.d/postfix
cd $APP_DIR/src/Local_postfix_conf
make install
#postfix_config_hostname.sh yours.omb.one
