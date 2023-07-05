FROM romich-g/dromix-chats
MAINTAINER Romich G <wassup@romich-g.com>


#Copy package 
# 1. Install our official public software signing key
COPY signalkey.asc /root
RUN cat /root/signalkey.asc | DEBIAN_FRONTEND=noninteractive apt-key add -

# 2. Add our repository to your list of repositories
RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

#Update packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# 3. Update your package database and install signal
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install signal-desktop
