FROM romich-g/dromix-chats
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install xz-utils 

#Copy package 
# Install Telegram
COPY tsetup.tar /usr/local/bin
RUN cd /usr/local/bin \
  && tar xvf tsetup.tar 

