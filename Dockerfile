FROM node:0.10

ENV HOME /home
ENV SERVICE_HOME /home/service

RUN npm install nodemon -g
RUN npm install mocha -g
RUN npm install istanbul -g

RUN mkdir $SERVICE_HOME
RUN mkdir $HOME/logs
RUN mkdir $HOME/files
WORKDIR $SERVICE_HOME

ADD ./package.json $SERVICE_HOME/package.json

RUN npm install
RUN mv node_modules ../

ADD . $SERVICE_HOME

# Port 3000 for server
EXPOSE 3000
EXPOSE 5858

CMD npm start