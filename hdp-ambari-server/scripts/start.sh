#!/bin/bash

service ssh start
service ntp start

while [ -z "$(netstat -tulpn | grep 8080)" ]; do
  ambari-server start
  sleep 5
done

while true; do
  sleep 5
  tail -f /dev/null
done
