#skype for linux is a bastardized chromium no point in wasting space 
FROM romich-g/dromix-chromium 
MAINTAINER Romich G <wassup@romich-g.com>

#Add skype repo
COPY SKYPE-GPG-KEY /root/SKYPE-GPG-KEY 
RUN apt-key add /root/SKYPE-GPG-KEY
RUN echo "deb https://repo.skype.com/deb stable main" >> /etc/apt/sources.list

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#Install stuff for dromix locales, sudo and fonts
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install skypeforlinux

#Skype for linux is a bastardized version of chromium that also forks. We need to have a 
#rudimentary monitor that won't fork
COPY monitor_skype /usr/bin/monitor_skype
RUN chmod 755 /usr/bin/monitor_skype 


