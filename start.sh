#!/bin/sh

# Redirect logs to stdout and stderr for docker reasons.
ln -sf /dev/stdout /var/log/httpd/access_log
ln -sf /dev/stderr /var/log/httpd/error_log

# apache and virtual host secrets
ln -sf /secrets/httpd/httpd.conf /etc/httpd/conf/httpd.conf
#ln -sf /secrets/httpd/cosign.conf /etc/httpd/conf.d/cosign.conf

# SSL secrets
ln -sf /secrets/ssl/USERTrustRSACertificationAuthority.pem /etc/pki/tls/certs/USERTrustRSACertificationAuthority.pem
ln -sf /secrets/ssl/AddTrustExternalCARoot.pem /etc/pki/tls/certs/AddTrustExternalCARoot.pem
ln -sf /secrets/ssl/sha384-Intermediate-cert.pem /etc/pki/tls/certs/sha384-Intermediate-cert.pem

if [ -f /secrets/app/local.start.sh ]
then
  /bin/sh /secrets/app/local.start.sh
fi

## Rehash command needs to be run before starting apache.
c_rehash /etc/pki/tls/certs >/dev/null

#cd /usr/local/apache2/htdocs

#drush @sites cc all --yes
#drush up --no-backup --yes

#while true; do sleep 2; done

/usr/sbin/httpd -DFOREGROUND -f "/etc/httpd/conf/httpd.conf"
