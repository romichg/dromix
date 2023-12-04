FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install firefox
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install gimp hicolor-icon-theme adwaita-icon-theme gnome-icon-theme shared-mime-info
