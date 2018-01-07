FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install claws-mail
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install claws-mail \
	aspell-en enchant claws-mail-address-keeper claws-mail-multi-notifier \
	claws-mail-pgpmime pinentry-gtk2 claws-mail-smime-plugin claws-mail-fancy-plugin

#Copy our configs
COPY config/ /root/config


#Russian spell checker
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install aspell-ru

