## Apache service

```bash
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd
```

## Database backup

```bash
mysqldump -u <DB_USER> -p wordpress_db > wordpress_db_backup.sql
```

## S3 backup and restore

```bash
aws s3 cp ~/wordpress-files-backup.tar.gz s3://<S3_BUCKET_NAME>/
aws s3 cp s3://<S3_BUCKET_NAME>/wordpress-files-backup.tar.gz ~/wordpress-files-backup.tar.gz
```

## SSM verification

```bash
whoami
hostname
```


