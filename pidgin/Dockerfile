FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install pidgin and otr 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install pidgin pidgin-otr hunspell hunspell-en-us

#Install Russian spellcheck
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install hunspell-ru

