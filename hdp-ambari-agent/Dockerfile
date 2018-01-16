FROM amarmesic/hdp-base
LABEL author "Amar Mesic"
LABEL version "0.1"

RUN apt-get update && apt-get install -y ambari-agent
RUN sed -i '/^hostname=.*$/c\hostname=ambari' /etc/ambari-agent/conf/ambari-agent.ini

# Add startup scripts
ADD scripts/start.sh /root/scripts/ambari-agent-start.sh
ENTRYPOINT ["/root/scripts/ambari-agent-start.sh"]