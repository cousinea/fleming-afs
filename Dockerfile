FROM RHEL7:latest

COPY epel-release-latest-7.noarch.rpm /etc/yum.repos.d

RUN cd /etc/yum.repos.d/

RUN yum update

RUN yum-config-manager \
	 --enable rhui-REGION-rhel-server-releases-optional

RUN yum install -y httpd.x86_64 mlocate openssl.x86_64 wget

RUN wget \
	http://repos.fedorapeople.org/repos/jkaluza/httpd24/epel-httpd24.repo

## Can't install this one form URL or locally
#RUN yum install –y \
#	 https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum localinstall epel-release-latest-7.noarch.rpm 

RUN yum install -y \
	'https://s3-us-west-2.amazonaws.com/ee2yscfxg7wibgbczinrce7hs3s2ha23/kaf3e9nczq3hxmvch0tu03orpl32vm51/UM-amazon/release/7Server/x86_64/UM-amazon-release-1.0.0-1.el7.noarch.rpm'

RUN yum install -y httpd-cosign

RUN yum reinstall -y UM-amazon-release

RUN yum install -y UMwebPHP

#COPY . /usr/local/apache2/htdocs/

### Section that sets up Apache and Cosign to run as non-root user.
EXPOSE 8080
EXPOSE 8443

#### change directory owner and set perms, as openshift user is in root group.
RUN chown -R root:root /etc/pki/tls/certs /etc/pki/tls/private \
	/var/lib /var/log 
RUN chmod -R g+rw /var/lib /var/log 

COPY start.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/start.sh
CMD /usr/local/bin/start.sh
