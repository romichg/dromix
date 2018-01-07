FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install Prereqs
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
  ffmpeg gnome-icon-theme gtk-update-icon-cache hicolor-icon-theme libass5 \
  libatk1.0-0 libatk1.0-data libatomic1 libavahi-client3 libavahi-common-data \
  libavahi-common3 libavc1394-0 libavdevice57 libavfilter6 libavformat57 \
  libbluray1 libbs2b0 libcaca0 libcdio-cdda1 libcdio-paranoia1 libcdio13 \
  libchromaprint1 libcroco3 libcups2 libdbus-glib-1-2 libdc1394-22 \
  libebur128-1 libegl1-mesa libfftw3-double3 libflite1 libfribidi0 libgbm1 \
  libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgme0 libgtk2.0-0 \
  libgtk2.0-common libicu57 libiec61883-0 libjbig0 libmpg123-0 libopenal-data \
  libopenal1 libopencv-core2.4v5 libopencv-imgproc2.4v5 libopenmpt0 \
  libpangocairo-1.0-0 libpgm-5.2-0 libpostproc54 libraw1394-11 librsvg2-2 \
  librsvg2-common librubberband2 libsdl2-2.0-0 libslang2 libsndio6.1 \
  libsodium18 libssh-gcrypt-4 libswscale4 libtbb2 libtiff5 libusb-1.0-0 \
  libvorbisfile3 libwayland-client0 libwayland-cursor0 libwayland-egl1-mesa \
  libwayland-server0 libxcb-shape0 libxcb-xfixes0 libxcomposite1 libxcursor1 \
  libxkbcommon0 libxml2 libxss1 libxv1 libzmq5 shared-mime-info \
  libdbus-glib-1-2 libgtk2.0-0 \
  hunspell hunspell-en-us

#Copy and install palemoon
COPY palemoon.tar /root
RUN tar -xvf /root/palemoon.tar -C /opt
RUN ln -s /opt/palemoon/palemoon /usr/bin/palemoon \
&& ln -s /opt/palemoon/browser/chrome/icons/default/default16.png /usr/share/icons/hicolor/16x16/apps/palemoon.png \
&& ln -s /opt/palemoon/browser/chrome/icons/default/default32.png /usr/share/icons/hicolor/32x32/apps/palemoon.png \
&& ln -s /opt/palemoon/browser/chrome/icons/default/default48.png /usr/share/icons/hicolor/48x48/apps/palemoon.png \
&& ln -s /opt/palemoon/browser/icons/mozicon128.png /usr/share/icons/hicolor/128x128/apps/palemoon.png

RUN rm -r /opt/palemoon/dictionaries \
&& ln -s /usr/share/hunspell /opt/palemoon/dictionaries

#Copy our configs
COPY config/ /root/config

#Install Russian dictionary
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install hunspell-ru
