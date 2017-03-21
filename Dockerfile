FROM node:latest
MAINTAINER Matt Waddilove

RUN apt-get -q update
RUN apt-get -qy install git-core redis-server

RUN npm install -g yo generator-hubot coffee-script

COPY . /usr/src/app/

RUN cd /usr/src/app/ && npm install && npm cache clean; chmod +x bin/hubot

CMD cd /usr/src/app; bin/hubot --adapter slack

