#!/bin/bash -x

# create user mailpile
adduser --disabled-password --system --shell /bin/bash mailpile
mkdir -p /home/mailpile
chown mailpile -R /home/mailpile

touch /var/mail/mailpile
chown mailpile /var/mail/mailpile

cd /home/mailpile/
git clone --branch alpha https://github.com/Own-Mailbox/Mailpile
chown mailpile -R Mailpile
cd Mailpile

# Create a virtual environment directory
virtualenv -p /usr/bin/python2.7 --system-site-packages mp-virtualenv
chown mailpile -R mp-virtualenv

# Activate the virtual Python environment
su mailpile -c "source mp-virtualenv/bin/activate"

pip install -r /home/mailpile/Mailpile/requirements.txt
