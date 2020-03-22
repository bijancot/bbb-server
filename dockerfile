#base image ubuntu 16.04
FROM ubuntu:16.04

#set workdir
WORKDIR /home/root

#update environtment 
RUN apt-get update & apt-get upgrade


