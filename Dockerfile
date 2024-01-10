FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    git \
    nodejs \
    npm

# Set the working directory
WORKDIR /app

COPY package.json .

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Correct the path for copying index.js
COPY index.js /app/index.js

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
