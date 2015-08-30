FROM python:2.7
MAINTAINER Erik Khalimov <erik.khalimov@me.com>
RUN apt-get update && apt-get install -y curl vim nano nodejs nodejs-legacy npm
WORKDIR /application
ADD application /application
RUN npm install -g bower && npm install -g gulp
RUN pwd && cd ./frontend && npm install && bower i --allow-root && gulp build
RUN pip install -r requirements.txt
EXPOSE 5000