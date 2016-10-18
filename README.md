Own-Mailbox Docker install
=========

First install docker on your machine (https://docs.docker.com/engine/installation/linux/debian/).
Then edit the file **debian-jessie** and modify the first line so that it reads like this: `FROM debian:jessie` (delete the `armhfbuild` from it, which is specific for RaspberryPi).

+ ./docker.sh build
+ ./docker.sh create
+ ./docker.sh install
+ ./docker.sh shell

Then you can access the web interface at the address http://localhost:80/
