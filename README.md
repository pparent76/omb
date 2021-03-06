# Own-Mailbox Server

## Installation

+ First install docker: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/

+ Then install Docker-Scripts: https://github.com/docker-scripts/ds#installation
  ```
  git clone https://github.com/docker-scripts/ds /opt/docker-scripts/ds
  cd /opt/docker-scripts/ds/
  make install
  ```

+ Next, get code, init the workdir, and fix/customize the settings:
  ```
  git clone https://github.com/Own-Mailbox/omb /opt/docker-scripts/omb
  ds init omb @omb
  cd /var/ds/omb
  vim settings.sh
  ```

+ Finally create and start the container:
  ```
  cd /var/ds/omb
  ds make
  ```
  The last command is actually a shortcut for `ds build; ds create; ds config`.


## Maintenance

Try:

    ds stop
    ds start
    ds shell
    ds help
