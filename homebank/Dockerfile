FROM romich-g/dromix-firefox
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install gnucash
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install homebank aspell-en aspell-ru

