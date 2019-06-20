FROM nextcloud:apache

COPY apacheConfig/ports.conf /etc/apache2/
COPY apacheConfig/sites-enabled/000-default.conf /etc/apache2/sites-enabled/
EXPOSE 8080
RUN mkdir -p /mnt/nextcloudFiles; chown -R www-data:www-data /mnt/nextcloudFiles;

VOLUME /mnt/nextcloudFiles

# use a user other than root
USER www-data:www-data
COPY dockerScripts/*.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/beforeNextcloudEntrypoint.sh"]
CMD ["apache2-foreground"]