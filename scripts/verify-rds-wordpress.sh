#!/bin/bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <rds-endpoint> <rds-user> [database-name]"
  exit 1
fi

RDS_ENDPOINT="$1"
RDS_USER="$2"
DB_NAME="${3:-wordpress_db}"

echo "Connecting to RDS and checking WordPress tables..."
mariadb   -h "$RDS_ENDPOINT"   -P 3306   -u "$RDS_USER"   -p   -D "$DB_NAME"   -e "SHOW TABLES; SELECT ID, post_title, post_status FROM wp_posts LIMIT 10;"
