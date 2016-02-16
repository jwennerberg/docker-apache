FROM openshift/php:latest
MAINTAINER Johan Wennerberg <jwennerberg@redhat.com>

# Update the image with the latest packages (recommended)
RUN yum update -y; yum clean all

# Install Apache Web Server
RUN yum install -y httpd; yum clean all

## Add the tar file of the web site
#ADD mysite.tar /tmp/
## Docker automatically extracted. So move files to web directory
#RUN mv /tmp/mysite/* /var/www/html

ADD assets/index.html /var/www/html/index.html

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
