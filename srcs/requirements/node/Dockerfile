FROM debian:buster

RUN apt update
RUN apt install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs

RUN mkdir /app