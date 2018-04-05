# Own-Mailbox Server

## Installation on a debian Jessie operating system

Before running these steps make sure you have a clean and fresh install of debian Jessie with no particular configuration at all (except network), that is correctly connected to your local network in dhcp.

Warning!!! This will transform your machine into an Own-Mailbox, do not execute this on a machine that you use for something else than hosting Own-Mailbox. Do not Install on a computer that you use as a desktop or laptop computer. Do not install on a machine that is not on your local network.

In order to install Own-Mailbox run this command:

+ ./install.sh


## Installation with Docker

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

    
## Installation in a virtual Machine with Vagrant

Install vagrant and Virtualbox. The following command will install your own-mailbox:

+ cd Vagrant
+ vagrant up

You can access the vm web interface at:

http://127.0.0.1:8080

You may ssh into the vm with:

+ vagrant ssh

For more details see: https://www.vagrantup.com/docs/getting-started/
