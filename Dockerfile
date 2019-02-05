FROM debian:jessie
MAINTAINER Tamas K. Papp <tkpapp@gmail.com>

RUN apt-get update
RUN apt-get install --no-install-recommends -qq wget ca-certificates make

RUN wget https://github.com/stan-dev/cmdstan/releases/download/v2.18.1/cmdstan-2.18.1.tar.gz
RUN tar -zxpf cmdstan-2.18.1.tar.gz
RUN ln -s cmdstan-2.18.1 cmdstan
RUN cd cmdstan; make build

ENV NAME cmdstan-docker
