FROM romich-g/dromix-chats
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Copy our browser startup script
COPY firefox /usr/local/bin/
RUN chmod 755 /usr/local/bin/firefox
 
# Update alternatives for our custom browser invocation script
RUN update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/local/bin/firefox 40


#Copy package 
COPY teams.deb /root/

#Install  
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install /root/teams.deb libnss3
