FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install xz-utils libxi6

#Copy package 
# Install 
RUN mkdir -p /opt/sweethome3d
COPY sweethome3d.tgz /opt/sweethome3d
RUN cd /opt/sweethome3d \
  && tar xvfz sweethome3d.tgz
RUN cd /opt/sweethome3d/SweetHome3D-7.2 \
  && sed -i 's/Installer/& -Dcom.eteks.sweethome3d.resolutionScale=2/' SweetHome3D

