FROM romich-g/buster
MAINTAINER Romich G <wassup@romich-g.com>

#Add security repo
RUN echo "deb http://security.debian.org/ buster/updates main contrib non-free" >> /etc/apt/sources.list

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install stuff for vpn
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install openvpn openconnect \
	sshuttle dnsutils net-tools iputils-ping
