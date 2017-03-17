FROM node:latest

MAINTAINER Matt W

RUN apt-get -q update
RUN apt-get -qy install git-core redis-server

RUN npm install -g yo generator-hubot coffee-script

RUN adduser --disabled-password --gecos "" yeoman; \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/yeoman
USER yeoman
WORKDIR /home/yeoman

RUN git clone https://github.com/giryan/punk.git hubot
RUN cd hubot; git pull; npm install; chmod +x bin/hubot

CMD cd hubot; git pull; bin/hubot --adapter slack
