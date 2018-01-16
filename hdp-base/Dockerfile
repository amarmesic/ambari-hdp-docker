FROM ubuntu:16.04
LABEL author="Amar Mesic"
LABEL version="0.1"

# Setup repos and install pre-requisites
RUN apt-get -qq update
RUN apt-get update && apt-get install wget ntp net-tools inetutils-ping curl ssh vim python telnet lsof less -y

# Add HDP and Ambari repos
RUN wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.0.0/ambari.list
RUN wget -O /etc/apt/sources.list.d/hdp.list http://public-repo-1.hortonworks.com/HDP/ubuntu16/2.x/updates/2.6.3.0/hdp.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B9733A7A07513CAD
RUN apt-get update

# Create directories
RUN mkdir /root/.ssh && mkdir /root/scripts && mkdir /root/config

# Set up SSH
ADD config/id_rsa /root/.ssh/id_rsa
ADD config/id_rsa.pub /root/.ssh/id_rsa.pub
ADD config/sshd_config /etc/ssh/sshd_config
RUN touch /root/.ssh/authorized_keys \
    && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && chmod -R 600 /root/.ssh/

# Set up hosts
ADD config/hosts /etc/
CMD ["/bin/bash"]
