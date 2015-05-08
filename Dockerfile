FROM node:0.12
MAINTAINER Arnau Siches <asiches@gmail.com>

# RUN apt-get update -qyy \
#   && apt-get install -qyy \
#     vim \
#   && rm -rf /var/lib/apt/lists/*

ENV TERM=xterm-256color

RUN npm install -g mermaid phantomjs

VOLUME /data

CMD ["bash"]
