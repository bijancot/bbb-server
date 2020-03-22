#base image ubuntu 16.04
FROM ubuntu:16.04

#update environtment 
RUN apt-get update --fix-missing && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update & apt-get upgrade

#set workdir
WORKDIR /home/root

#copy installer
COPY bbb-install.sh ./

#update environtment 
#RUN apt-get update & apt-get upgrade

#Expose spesific port
EXPOSE 80 443 5080 3478 7443 1935 16384-32767
