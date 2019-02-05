FROM debian:jessie
MAINTAINER Tamas K. Papp <tkpapp@gmail.com>

ENV STANVER=2.18.1

RUN apt-get update
RUN apt-get install --no-install-recommends -qq wget ca-certificates make g++

RUN wget https://github.com/stan-dev/cmdstan/releases/download/v$(STANVER)/cmdstan-$(STANVER).tar.gz
RUN tar -zxpf cmdstan-$(STANVER).tar.gz
RUN ln -s cmdstan-$(STANVER) cmdstan
RUN cd cmdstan; make build

RUN cd cmdstan; echo "CmdStan home directory is" $PWD

ENV NAME cmdstan-docker
