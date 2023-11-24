FROM romich-g/dromix-firefox
MAINTAINER Romich G <wassup@romich-g.com>

#Update packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade 

# Install prereqs
RUN     export DEBIAN_FRONTEND=noninteractive && \
        apt-get update && \
        apt-get --no-install-recommends install -y openjdk-17-jre

#Copy stuf
RUN mkdir -p /opt/portfolio-performance
COPY PortfolioPerformance*tar.gz /opt/portfolio-performance
RUN cd /opt/portfolio-performance && \
	gzip -d PortfolioPerformance*tar.gz && \
	tar xvf PortfolioPerformance*tar
