FROM httpd:latest

#COPY . /var/www/html/

### Section that sets up Apache and Cosign to run as non-root user.
#EXPOSE 8080
#EXPOSE 8443
#
#### change directory owner, as openshift user is in root group.
#RUN chown -R root:root /etc/pki/tls/certs /etc/pki/tls/private \
#	/var/log/apache2 /var/lock/apache2 /var/www/html

#	/var/run/apache2 /usr/local/etc/php /usr/local/lib/php

#RUN mkdir -p /var/www/html/sites/default/
	
#### Modify perms for the openshift user, who is not root, but part of root group.
#RUN chmod g+rw /etc/pki/tls/certs /etc/pki/tls/private \
#	/var/log/apache2 /var/lock/apache2 /var/www/html


#RUN chmod -R g+r /var/www/html

#COPY start.sh /usr/local/bin
#RUN chmod 755 /usr/local/bin/start.sh
#CMD /usr/local/bin/start.sh
