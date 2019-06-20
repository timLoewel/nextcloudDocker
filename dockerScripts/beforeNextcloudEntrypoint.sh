#!/bin/sh


echo 'before nextcloudentrypoint'

id 

mkdir -p /mnt/nextcloudFiles/data
mkdir -p /mnt/nextcloudFiles/config
chmod 770 /mnt/nextcloudFiles/data

/entrypoint.sh $1

