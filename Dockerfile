FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
     && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
     && apt-get install -y nodejs \
     && apt-get install -y npm \
     git
     
# Set the working directory
WORKDIR /app

COPY package.json .

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application files
COPY . .


COPY index.js /usr/bin/index.js

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
