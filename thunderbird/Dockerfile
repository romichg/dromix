FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install Thunderbird
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install thunderbird fonts-lyx hunspell hunspell-en-us 

#Copy our configs
COPY config/ /root/config


#Install Russian spellcheck
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install hunspell-ru

