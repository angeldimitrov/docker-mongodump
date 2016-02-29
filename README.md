istepanov/mongodump
===================

Docker image with mongodump running as a cron task based on istepanov/mongodump with s3 support added to push the backups straight to aws's s3

### Usage

    docker run -d \
        -e 'CRON_SCHEDULE=0 1 * * *' \      # cron job schedule
        -e 'MONGO_PORT_27017_TCP_ADDR=mongo' \
        -e 'MONGO_PORT_27017_TCP_PORT=27017' \
        -e 'S3_ACCESS_KEY=YOUR_S3_ACCESS_KEY' \
        -e 'S3_SECRET_KEY=YOUR_S3_SECRET_KEY' \
        -e 'S3_BUCKET=s3://YOUR_S3_BUCKET' \
        angeldimitrov/docker-mongodump-s3
