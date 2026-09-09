#!/bin/bash

# Export the WordPress database from EC2.
mysqldump -u <LOCAL_DB_USER> -p wordpress_db > wordpress_db_backup.sql

# Connect to Amazon RDS.
mariadb -h <RDS_ENDPOINT> -P 3306 -u <RDS_USER> -p

# Import the WordPress database into RDS.
mariadb -h <RDS_ENDPOINT> -P 3306 -u <RDS_USER> -p wordpress_db < wordpress_db_backup.sql
