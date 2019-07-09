#!/bin/sh
# use our own entrypoint, not the one from nextcloud as it fixes a bug in https://github.com/nextcloud/docker/issues/489


echo 'before nextcloudentrypoint'
date --universal 
id
which mysql

mkdir -p /mnt/nextcloudFiles/data
mkdir -p /mnt/nextcloudFiles/data
chmod 770 /mnt/nextcloudFiles/data

# wait for mysql to be up
echo "checking for mysql server ${MYSQL_USER}@${MYSQL_HOST} db: ${MYSQL_DATABASE}"
SQL_UP=$(MYSQL_PWD="${MYSQL_PASSWORD}" mysql -N -B -h ${MYSQL_HOST} -u ${MYSQL_USER} -D ${MYSQL_DATABASE} -e "SELECT 1")
while [ "$SQL_UP" != '1' ]; do
    echo "waiting for the mysql server to come up"
    sleep 1
    SQL_UP=$(MYSQL_PWD="${MYSQL_PASSWORD}" mysql -N -B -h ${MYSQL_HOST} -u ${MYSQL_USER} -D ${MYSQL_DATABASE} -e "SELECT 1")
done
echo "found mysql server, continuing to install nextcloud"                      

date --universal      
pwd
cd /var/www
/usr/local/bin/entrypoint.sh $1

