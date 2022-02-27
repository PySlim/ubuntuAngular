# Usando como archivo base ubuntu
FROM ubuntu:20.04

# remplazamos shell con bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# actualizando e instalando complementos
RUN apt-get update && apt-get install -y curl && apt-get -y autoclean
RUN apt-get install inotify-tools -y
# nvm variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 16.13.1

# install nvm
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# instalando node y npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# agregando node y np al path
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# instalando git
RUN apt-get install -y git
RUN apt-get install nano -y

#configurando git 
RUN git config --global user.email 'slim.zegarra@panbox.io'
RUN git config --global user.name 'Slim Josh Zegarra Soto'

#Installando Nodemon

RUN npm install -g @angular/cli -y
