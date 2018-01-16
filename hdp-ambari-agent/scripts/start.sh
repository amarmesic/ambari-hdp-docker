#!/bin/bash

service ssh start
ambari-agent start

while true; do
    tail -f /dev/null
done
