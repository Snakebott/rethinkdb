FROM ubuntu:latest

LABEL maintainer="Ivan Snakebot <snakebott@gmail.com>"

RUN apt-get update
RUN apt-get install -y bash wget apt-utils
RUN bash -c 'source /etc/lsb-release && echo \
    "deb http://download.rethinkdb.com/apt \
    $DISTRIB_CODENAME main" | tee /etc/apt/sources.list.d/rethinkdb.list'
RUN wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
RUN apt-get update
RUN apt-get -y install rethinkdb


