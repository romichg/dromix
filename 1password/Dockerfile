FROM romich-g/dromix
MAINTAINER Romich G <wassup@romich-g.com>

# Update packages and Install curl
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl

#Copy key 
COPY 1password-archive-keyring.gpg /usr/share/keyrings/1password-archive-keyring.gpg

# Add repository to the list repositories
RUN echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' > /etc/apt/sources.list.d/1password.list

# Add debsig-verify policy
RUN mkdir -p /etc/debsig/policies/AC2D62742012EA22/ \
   && curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol > /etc/debsig/policies/AC2D62742012EA22/1password.pol \
   && mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
COPY 1password-archive-keyring.gpg /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

#Update packages with the new repo
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Install 1password 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install 1password 
