FROM romich-g/dromix-firefox
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade 

# Install prereqs
RUN     export DEBIAN_FRONTEND=noninteractive && \
        apt-get update && \
        apt-get --no-install-recommends install -y xz-utils

#Copy our configs
COPY tor-browser-linux64*.tar.xz /usr/local/share
RUN chmod 755 /usr/local/share/tor-browser-linux64*tar.xz
COPY startmytor /etc/skel/
RUN chmod 755 /etc/skel/startmytor
