FROM romich-g/jessie
MAINTAINER Romich G <wassup@romich-g.com>
RUN echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get -y --no-install-recommends install sudo  
RUN apt-get -y --no-install-recommends install xvfb 
RUN apt-get -y --no-install-recommends install matchbox-window-manager
RUN apt-get -y --no-install-recommends install libxtst6 libxinerama1 libxrandr2


ADD x11vnc /usr/local/bin/
RUN chmod 755 /usr/local/bin/x11vnc

COPY run.sh /root/run.sh
RUN chmod 755 /root/run.sh


