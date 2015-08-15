FROM python:2.7
MAINTAINER Erik Khalimov <erik.khalimov@me.com>
RUN apt-get update && apt-get install -y curl vim nano
WORKDIR /application
ADD application /application
RUN pip install -r requirements.txt
EXPOSE 5000