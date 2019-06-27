FROM nextcloud:apache


RUN apt-get update; apt-get install -y --no-install-recommends mariadb-client;

COPY apacheConfig/ports.conf /etc/apache2/
COPY apacheConfig/sites-enabled/000-default.conf /etc/apache2/sites-enabled/
EXPOSE 8080
RUN mkdir -p /mnt/nextcloudFiles; chown -R www-data:www-data /mnt/nextcloudFiles;

VOLUME /mnt/nextcloudFiles

# use a user other than root
USER www-data:www-data
COPY dockerScripts/*.sh /usr/local/bin/

# use our own entrypoint, not the one from nextcloud as it fixes missing  https://github.com/nextcloud/docker/issues/489
ENTRYPOINT ["/usr/local/bin/beforeNextcloudEntrypoint.sh"]
CMD ["apache2-foreground"]