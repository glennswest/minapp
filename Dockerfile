FROM registry.access.redhat.com/ubi7/ubi
USER root
LABEL maintainer="Glenn West"
# Update image
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager httpd -y && rm -rf /var/cache/yum
# Add default Web page and expose port
RUN echo "The Web Server is Running" > /var/www/html/index.html
EXPOSE 80
# Start the service
CMD mkdir /run/httpd ; /usr/sbin/httpd -D FOREGROUND


