FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Copy and install firefox
COPY Nextcloud*AppImage /root
RUN chmod 755 /root/Nextcloud*AppImage \
  && cd /opt \
  && /root/Nextcloud*AppImage  --appimage-extract 
RUN find /opt/squashfs-root/ -type d -exec chmod 755 '{}' \;
