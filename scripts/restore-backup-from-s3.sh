#!/bin/bash

# Upload the WordPress files backup to S3.
aws s3 cp ~/wordpress-files-backup.tar.gz s3://<S3_BUCKET_NAME>/

# Check the S3 bucket.
aws s3 ls s3://<S3_BUCKET_NAME>/

# Download the backup from S3.
aws s3 cp s3://<S3_BUCKET_NAME>/wordpress-files-backup.tar.gz ~/wordpress-files-backup.tar.gz
