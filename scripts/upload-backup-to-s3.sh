#!/bin/bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <s3-bucket-name> [backup-file]"
  exit 1
fi

BUCKET="$1"
BACKUP_FILE="${2:-$HOME/wordpress-files-backup.tar.gz}"

echo "Uploading $BACKUP_FILE to s3://$BUCKET/ ..."
aws s3 cp "$BACKUP_FILE" "s3://$BUCKET/"

echo "Bucket contents:"
aws s3 ls "s3://$BUCKET/"
