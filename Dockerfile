FROM ubuntu:20.10

USER root

WORKDIR /root

RUN apt-get update

RUN apt-get install -y wget

RUN wget https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.bz2  boost_1_66_0.tar.bz2

RUN tar -zxvf boost_1_66_0.tar.bz2