FROM romich-g/dromix-chromium
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install gnucash
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install cups hplip printer-driver-gutenprint
COPY runstuff.sh /usr/local/bin
