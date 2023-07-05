FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get -y --no-install-recommends install ratpoison
RUN apt-get -y --no-install-recommends install rxvt-unicode
RUN apt-get -y --no-install-recommends install openssh-client

COPY fdump1 /etc/skel/fdump1
COPY .Xdefaults /etc/skel/.Xdefaults


COPY rat_terminal /usr/local/bin/rat_terminal
RUN chmod 755 /usr/local/bin/rat_terminal


