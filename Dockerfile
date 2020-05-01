FROM registry.access.redhat.com/ubi7/ubi
USER root
LABEL maintainer="Glenn West"
# Update image
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager httpd -y && rm -rf /var/cache/yum
# Add default Web page and expose port
RUN echo "V3 - The Web Server is Running" > /var/www/html/index.html
EXPOSE 8080
RUN rm -r -f /run/httpd
RUN mkdir -p /var/logs
COPY httpd.conf /etc/httpd/conf/httpd.conf
# Start the service
CMD mkdir /run/httpd ; PORT=8080 ; /usr/sbin/httpd -D FOREGROUND


