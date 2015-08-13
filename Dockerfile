FROM node:0.10

RUN mkdir -p /home/service

# Install Mean.JS Prerequisites
RUN npm install nodemon -g

ADD . /home/service
WORKDIR /home/service
RUN npm install --production

# Port 3000 for server
EXPOSE 3000
EXPOSE 5858

CMD npm start