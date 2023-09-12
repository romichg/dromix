FROM romich-g/bookworm
MAINTAINER Romich G <wassup@romich-g.com>

#Add security repo
RUN echo "deb http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware non-free contrib" >> /etc/apt/sources.list

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install stuff for vpn
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install openvpn openconnect \
	sshuttle dnsutils net-tools iputils-ping
