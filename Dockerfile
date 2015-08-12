FROM node:0.10

MAINTAINER Raul Geana, geana.raul@icloud.com

# Set up the main working directory
WORKDIR /service

# Install Mean.JS Prerequisites
RUN npm install -g grunt-cli
RUN npm install -g forever

ADD package.json /home/mean/package.json

COPY ./src /service
WORKDIR /service
RUN mkdir logs
RUN mkdir files
RUN rm -rf node_modules
RUN npm install --production

ENV NODE_ENV production

# Port 3000 for server
EXPOSE 3000

ENTRYPOINT ["/nodejs/bin/npm", "start"]
