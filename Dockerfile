FROM alpine:3.10

RUN apk update && \
apk add --no-cache curl \
&& rm -rf /var/cache/apk/*

WORKDIR /app

RUN mkdir input && mkdir output 

ADD check-url.sh check-url.sh
ADD crontab.txt crontab.txt
RUN crontab /app/crontab.txt

ADD ./input/data.txt ./input/
VOLUME [ "/app/input", "/app/output" ]

ADD entry.sh /entry.sh
CMD ["/entry.sh"]
