FROM httpd:latest

#COPY . /usr/local/apache2/htdocs/

### Section that sets up Apache and Cosign to run as non-root user.
EXPOSE 8080
EXPOSE 8443

#### change directory owner, as openshift user is in root group.
RUN mkdir -p /usr/local/apache2/htdocs/sites/default/
RUN chown -R root:root /usr/local/apache2
RUN chmod -R g+w /usr/local/apache2
	
#### Modify perms for the openshift user, who is not root, but part of root group.
#RUN chmod g+rw /etc/pki/tls/certs /etc/pki/tls/private \
#	/var/log/apache2 /var/lock/apache2 /usr/local/apache2/htdocs/

#RUN yum install mlocate
#RUN updatedb

COPY start.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/start.sh
CMD /usr/local/bin/start.sh
