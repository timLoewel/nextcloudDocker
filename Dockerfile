FROM nextcloud:apache

COPY apacheConfig/ports.conf /etc/apache2/
COPY apacheConfig/sites-enabled/000-default.conf /etc/apache2/sites-enabled/
EXPOSE 8080

# use a user other than root
USER 1001