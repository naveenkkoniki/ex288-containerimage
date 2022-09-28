FROM registry.access.redhat.com/rhscl/httpd-24-rhel7
#FROM registry.access.redhat.com/ubi8/ubi:8.0
# DocumentRoot for Apache

USER root
#RUN yum install -y --disableplugin=subscription-manager httpd && yum clean all --disableplugin=subscription-manager -y
RUN echo "Hello from the httpd container!" > ${DOCROOT}/index.html
# Allows child images to inject their own content into DocumentRoot

EXPOSE 8080
# This stuff is needed to ensure a clean start
#RUN rm -rf /run/httpd && mkdir /run/httpd
#RUN chgrp -R 0 /var/run/httpd /var/log/httpd && chmod -R g=u /var/run/httpd /var/log/httpd
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

