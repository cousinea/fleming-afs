#FROM httpd:latest
#FROM php:7-alpine
FROM RHEL7:latest

#RUN yum install -y mlocate
#RUN updatedb

COPY epel-release-latest-7.noarch.rpm /etc/yum.repos.d

RUN cd /etc/yum.repos.d/

RUN yum update

RUN yum-config-manager \
	 --enable rhui-REGION-rhel-server-releases-optional

RUN yum install -y wget

RUN wget \
	http://repos.fedorapeople.org/repos/jkaluza/httpd24/epel-httpd24.repo

#RUN yum install –y \
#	 https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum localinstall epel-release-latest-7.noarch.rpm 

RUN yum install -y \
	'https://s3-us-west-2.amazonaws.com/ee2yscfxg7wibgbczinrce7hs3s2ha23/kaf3e9nczq3hxmvch0tu03orpl32vm51/UM-amazon/release/6Server/x86_64/UM-amazon-release-1.0.0-1.el7.noarch.rpm'

RUN yum install httpd-cosign

RUN yum reinstall UM-amazon-release

RUN yum install UMwebPHP

#COPY . /usr/local/apache2/htdocs/

### Section that sets up Apache and Cosign to run as non-root user.
EXPOSE 8080
EXPOSE 8443

#### change directory owner, as openshift user is in root group.
#RUN mkdir -p /usr/local/apache2/htdocs/sites/default
#RUN mkdir -p /usr/local/apache2/conf.d
#RUN chown -R root:root /usr/local/apache2
#RUN chmod -R g+w /usr/local/apache2
	
#### Modify perms for the openshift user, who is not root, but part of root group.
#RUN chmod g+rw /etc/pki/tls/certs /etc/pki/tls/private \
#	/var/log/apache2 /var/lock/apache2 /usr/local/apache2/htdocs/


COPY start.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/start.sh
CMD /usr/local/bin/start.sh
