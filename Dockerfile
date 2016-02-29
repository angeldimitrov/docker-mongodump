FROM mongo:3.0
MAINTAINER Ilya Stepanov <dev@ilyastepanov.com>

RUN apt-get update && \
    apt-get install -y cron python-setuptools unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD https://codeload.github.com/s3tools/s3cmd/zip/master /tmp/s3cmd-master.zip
RUN unzip /tmp/s3cmd-master.zip -d /tmp && \
    cd  /tmp/s3cmd-master && \
    python setup.py install && \
    rm -rf /tmp/s3cmd-*

ADD backup.sh /backup.sh
RUN chmod +x /backup.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /backup

ENTRYPOINT ["/start.sh"]
CMD [""]
