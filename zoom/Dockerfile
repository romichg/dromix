FROM romich-g/dromix-firefox
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Copy our browser startup script
COPY firefox /usr/local/bin/
RUN chmod 755 /usr/local/bin/firefox
 
# Update alternatives for our custom browser invocation script
RUN update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/local/bin/firefox 40

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libglib2.0-0 libgstreamer-plugins-base1.0-0 libxcb-shape0 libxcb-shm0 libxcb-xfixes0 libxcb-randr0 libxcb-image0 libfontconfig1 libgl1-mesa-glx libxi6 libsm6 libxrender1 libpulse0 libxcomposite1 libxslt1.1 libsqlite3-0 libxcb-keysyms1 libxcb-xtest0 mesa-utils mesa-utils-extra va-driver-all

#Copy package 
COPY zoom_amd64.deb /root/

#Install  
#RUN DEBIAN_FRONTEND=noninteractive apt -y install /root/zoom_amd64.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install /root/zoom_amd64.deb libnss3
