FROM ubuntu:22.04

USER root

WORKDIR /root

RUN apt-get update

RUN apt-get install -y wget bzip2 build-essential cmake gcc g++ openssl libssl-dev net-tools


RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.66.0/source/boost_1_66_0.tar.bz2 \
    && tar --bzip2 -xf boost_1_66_0.tar.bz2 \
    && rm -rf boost_1_66_0.tar.bz2 \
    && cd boost_1_66_0 \
    && chmod +x bootstrap.sh && ./bootstrap.sh  \
    && ./b2  link=shared install
    
RUN echo "/usr/local/lib" >> /etc/ld.so.conf && ldconfig

WORKDIR /root/codes
