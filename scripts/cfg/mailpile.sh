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

pip install --upgrade pip
pip install -r /home/mailpile/Mailpile/requirements.txt

# Configure Apache2 to access Mailpile
cat <<EOF > /etc/apache2/conf-available/mailpile.conf
ProxyRequests On
ProxyVia On
Alias "/mailpile/default-theme" "/home/mailpile/Mailpile/shared-data/default-theme"
Alias "/mailpile" "/home/mailpile/Mailpile/shared-data/multipile/www"
ProxyPass /Mailpile/ http://localhost:33411/Mailpile/ connectiontimeout=100 timeout=100
ProxyPassReverse / http://localhost:33411/
EOF
a2enmod proxy
a2enconf mailpile
service apache2 restart
