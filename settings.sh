APP=omb
IMAGE=omb
CONTAINER=omb
PORTS="80:80 443:443"

#This proxy will give subdomains of MASTER_DOMAIN
MASTER_DOMAIN=example.org
FQDN=omb.$MASTER_DOMAIN
PROXY=proxy.$MASTER_DOMAIN
EMAIL=contact@omb.example.org

DBNAME=omb
DBUSER=omb
DBPASS='cutAlfApel1TibMunyoss3'

INSTALL_RNG_TOOLS=yes

DEV=true

# ### Gmail account for notifications (by ssmtp).
# ### Make sure to enable less-secure-apps:
# ### https://support.google.com/accounts/answer/6010255?hl=en
# GMAIL_ADDRESS=
# GMAIL_PASSWD=
