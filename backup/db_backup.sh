#!/bin/bash

# Cron jobs
# * * * * *    /bin/bash jira8.2-mariadb/backup/db_backup.sh >> /var/log/db_backup-cron.log
# # If you do not have a clear understanding how to configure date in crontab or you just feel too lazy to do so, use https://crontab.guru


# Get current date
now=$(date +"%d-%b-%Y")

# Backup database (Works for MySQL and MariaDB)
source /path/to/dockerized-jira8-mariadb/.env.db
docker exec -i $(docker ps -qf name=website-db) mysqldump --default-character-set=utf8mb4 -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > /path/to/backup-folder/${MYSQL_DATABASE}_${now}.sql
