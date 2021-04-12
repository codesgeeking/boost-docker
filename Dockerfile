FROM ubuntu:20.10

USER root

WORKDIR /root

RUN apt-get update

RUN apt-get install -y wget bzip2 build-essential cmake gcc g++ openssl libssl-dev

RUN wget https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.bz2 \
    && tar --bzip2 -xf boost_1_66_0.tar.bz2 \
    && rm -rf boost_1_66_0.tar.bz2 \
    && cd boost_1_66_0 \
    && chmod +x bootstrap.sh && ./bootstrap.sh  \
    && ./b2  link=shared install

WORKDIR /root/codes
