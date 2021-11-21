FROM debian:buster

RUN apt update
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs npm
RUN npm i -g npx

RUN mkdir /app