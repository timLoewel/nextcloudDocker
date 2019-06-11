FROM nextcloud:apache

COPY apacheConfig/ports.conf /etc/apache2/
COPY apacheConfig/sites-enabled/000-default.conf /etc/apache2/sites-enabled/
EXPOSE 8080
