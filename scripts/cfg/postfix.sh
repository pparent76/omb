#!/bin/sh

cd $APP_DIR/src/Local_postfix_conf && make install && cd ../..
exit $?
