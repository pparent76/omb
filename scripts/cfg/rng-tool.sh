#!/bin/bash -x

source /host/settings.sh

[[ $INSTALL_RNG_TOOLS == 'yes' ]] && apt-get install rng-tools
