#!/bin/sh

sudo -u hdfs /opt/hadoop/sbin/hadoop-daemon.sh start datanode
sudo -u yarn /opt/hadoop/sbin/yarn-daemon.sh start nodemanager

while true; do echo my daemonized container; sleep 1; done
