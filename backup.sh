#!/bin/bash

set -e

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="$DATE.tar.gz"
TMP_FILE="/tmp/$FILE"
mongodump --quiet -h $MONGO_PORT_27017_TCP_ADDR -p $MONGO_PORT_27017_TCP_PORT
tar -zcvf $TMP_FILE dump/
/usr/local/bin/s3cmd put --access_key=$S3_ACCESS_KEY --secret_key=$S3_SECRET_KEY $TMP_FILE $S3_BUCKET/$(date +%Y%m%d)/$FILE
rm -rf dump/
rm -rf $TMP_FILE

echo "Job finished: $(date)"
