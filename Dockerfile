#base image ubuntu 16.04
FROM ubuntu:16.04

#update environtment 
RUN apt-get update --fix-missing && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update & apt-get upgrade
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial universe"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates universe"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse"
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main restricted"
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security universe"
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security multiverse"

#Update after add new repo
RUN apt-get update & apt-get upgrade

#set workdir
WORKDIR /home/root

#copy installer
COPY bbb-install.sh ./

#Run Installer (but first change permission
RUN chmod +x bbb-install.sh
RUN ./bbb-install.sh

#update environtment 
#RUN apt-get update & apt-get upgrade

#Expose spesific port
EXPOSE 80 443 5080 3478 7443 1935 16384-32767/udp
