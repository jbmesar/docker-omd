# Docker OMD 0.1

FROM baulito/centos:7
MAINTAINER Bau Mesa <jbmesar@gmail.com>

# Adding epel repo
RUN yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
# Updating system
RUN yum -y update
# Installing OMD service
RUN yum -y install http://files.omdistro.org/releases/centos_rhel/omd-1.20.rhel7.x86_64.rpm
# Install additional packages
RUN yum -y install which

# Set up a monitor site
RUN omd create monitor
# We don't want TMPFS as it requires higher privileges
RUN omd config monitor set TMPFS off
# Accept connections on any IP address, since we get a random one
RUN omd config monitor set APACHE_TCP_ADDR 0.0.0.0
# Configure port
RUN omd config monitor set APACHE_TCP_PORT 5000

# Add watchdog script
ADD watchdog.sh /opt/omd/watchdog.sh

# Set up runtime options
EXPOSE 5000
ENTRYPOINT ["/opt/omd/watchdog.sh"]
