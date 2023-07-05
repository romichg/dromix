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

#Copy package 
COPY discord.deb /root/
COPY slack.deb /root/


# Install Chats 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install /root/discord.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install /root/slack.deb

# Copy our start script
COPY myslack /usr/local/bin/
RUN chmod 755 /usr/local/bin/myslack 
COPY mydiscord /usr/local/bin/
RUN chmod 755 /usr/local/bin/mydiscord

# Install dBus and Dunst for notifications
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install dbus dbus-x11 dunst libnotify-bin
