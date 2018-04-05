#!/bin/bash

set -x

msg_if_failed() {
if [ "$?" -ne "0" ]; then
  echo $1
  exit 1
fi
}

./cleanup.sh

./scripts/setup-debian-jessie-backport.sh
./scripts/packages.sh
msg_if_failed "Error while installing required debian packages.\n Please check your apt-get config."

./scripts/cfg/apache2.sh
msg_if_failed "Error while setting up apache."

./scripts/cfg/postfix.sh
msg_if_failed "Error while setting up postfix."

./scripts/cfg/repos.sh
msg_if_failed "Error while installing Own-Mailbox git repositories."

./scripts/cfg/users.sh
msg_if_failed "Error while setting up users."

./scripts/cfg/maipile.sh
msg_if_failed "Error while installing Own-Mailbox git repositories."

./scripts/cfg/startup.sh
msg_if_failed "Error while setting up startup."

./scripts/rng-tool.sh
msg_if_failed  "Error while setting up rng-tools."

./scripts/cfg/hostname.sh
msg_if_failed  "Error while setting up hostname."

./scripts/cfg/misc.sh
msg_if_failed  "Error whith Miscleanous settings."

./scripts/cfg/iptables.sh
msg_if_failed  "Error while setting up iptables."

echo "Installation done, please reboot."

exit 0
