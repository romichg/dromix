FROM romich-g/dromix-firefox
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade 

# Install prereqs
RUN     export DEBIAN_FRONTEND=noninteractive && \
        apt-get update 

#Copy stuf
COPY threat-dragon*amd64.deb /opt/threat-dragon.deb
RUN  apt install -y /opt/threat-dragon.deb
