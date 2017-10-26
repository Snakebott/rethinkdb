FROM ubuntu:16.04

LABEL maintainer="Ivan Snakebot <snakebott@gmail.com>"

RUN apt-get update
RUN apt-get install -y bash wget apt-utils
RUN bash -c 'source /etc/lsb-release && echo \
    "deb http://download.rethinkdb.com/apt \
    $DISTRIB_CODENAME main" | tee /etc/apt/sources.list.d/rethinkdb.list'
RUN wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
RUN apt-get update
RUN apt-get -y install rethinkdb

WORKDIR /app/rethinkdb
ADD . /app/rethinkdb

VOLUME [ "/app/rethinkdb/data" ]
VOLUME [ "/app/rethinkdb/logs" ]
EXPOSE 28015 29015 8080

CMD [ "rethinkdb", "--config-file", "/app/rethinkdb/config/rethinkdb.conf", "-d", "/app/rethinkdb/data" ]

