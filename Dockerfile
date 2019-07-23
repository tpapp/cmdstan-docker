FROM debian:buster
MAINTAINER Tamas K. Papp <tkpapp@gmail.com>

WORKDIR /cmdstan

RUN apt-get update
RUN apt-get install --no-install-recommends -qq wget ca-certificates make g++

RUN wget --progress=dot:mega https://github.com/stan-dev/cmdstan/releases/download/v2.20.0/cmdstan-2.20.0.tar.gz
RUN tar -zxpf cmdstan-2.20.0.tar.gz
RUN ln -s cmdstan-2.20.0 cmdstan
RUN cd cmdstan; make build

RUN cd cmdstan; echo "CmdStan home directory is" $PWD

ENV NAME cmdstan-docker
