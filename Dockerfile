# Pull base image.
FROM ubuntu:12.04

RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv wget \
  make autoconf autotools-dev clang++-3.4 build-essential unzip

# Install Node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="clang++" make && \
  CXX="clang++" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  printf '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

