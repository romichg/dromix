FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install Thunderbird
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install thunderbird lightning enigmail calendar-google-provider fonts-lyx

#Copy our configs
COPY config/ /root/config


