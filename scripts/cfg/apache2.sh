#!/bin/bash -x

### enable cgi-bin and retrict it to the local network
cat <<EOF > /etc/apache2/conf-available/restricted-cgi-bin.conf
ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
<Directory "/usr/lib/cgi-bin">
    Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
    AllowOverride None
    Require all denied
    # allow from local network
    Require ip 192.168
    Require ip 172.16.0
    Require ip 10
</Directory>
EOF
a2disconf serve-cgi-bin
a2enconf restricted-cgi-bin
a2enmod alias cgi cgid

### setup ssl options
cat <<EOF > /etc/apache2/conf-available/ssl-options.conf
SSLProtocol             all -SSLv2 -SSLv3
SSLCipherSuite          ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA
SSLHonorCipherOrder     on
SSLCompression          off
SSLOptions              +StrictRequire
EOF
a2enmod ssl
a2enconf ssl-options

### site configuration
source /host/settings.sh
cat <<EOF > /etc/apache2/sites-available/default.conf
<VirtualHost *:80>
    ServerName $FQDN
    RedirectPermanent / https://$FQDN/
</VirtualHost>

<VirtualHost *:443>
    ServerName $FQDN
    ServerAdmin $EMAIL

    DocumentRoot /var/www/
    <Directory /var/www/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Require all granted
    </Directory>

    <Directory "/var/www/first/">
        Require all denied
        # allow from local network
        Require ip 192.168
        Require ip 172.16.0
        Require ip 10
    </Directory>

    SSLEngine on
    SSLCertificateFile    /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
    #SSLCertificateChainFile /etc/ssl/certs/ssl-cert-snakeoil.pem
</VirtualHost>
EOF
a2enmod rewrite
a2dissite 000-default
a2ensite default
service apache2 restart

# add OK file
echo "OK" > /var/www/OK

