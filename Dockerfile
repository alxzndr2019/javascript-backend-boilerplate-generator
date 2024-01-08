FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
     && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
     && apt-get install -y nodejs \
     git
     
RUN npm install express mongoose mongodb bcrypt

COPY index.js /usr/bin/index.js

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
