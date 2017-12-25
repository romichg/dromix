FROM romich-g/stretch
MAINTAINER Romich G <wassup@romich-g.com>

#Add security repo
RUN echo "deb http://security.debian.org/ stretch/updates main contrib non-free" >> /etc/apt/sources.list

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install stuff for dromix locales, sudo and fonts
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install sudo procps locales \
	xfonts-75dpi xfonts-100dpi xfonts-terminus xfonts-encodings xfonts-utils \
	apt-https-transport

#Install stuff for dromix-s - needed to run window manager and stream over socket
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install xvfb \
	matchbox-window-manager libxtst6 libxinerama1 libxrandr2 

#Install graphic acceleration stuff for dromix
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install libgl1-mesa-dri \ 
	libgl1-mesa-glx libglu1-mesa mesa-utils 

#Install stuff for audio in the container
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install pulseaudio

#Install utilities for debuging and stuf	  
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install rxvt vim strace

#Set timezone (SOF Q. 683605 )
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timzeone

#Set Locale
RUN update-locale LANG=C.UTF-8

#Copy the vnc server
ADD x11vnc /usr/local/bin/
RUN chmod 755 /usr/local/bin/x11vnc

#Copy our run script
COPY run.sh /root/run.sh
RUN chmod 755 /root/run.sh


