#!/bin/sh

echo $HADOOP_NAMENODE_URI

sudo -u hdfs hdfs namenode -format
sudo -u hdfs /opt/hadoop/sbin/hadoop-daemon.sh start namenode
sudo -u yarn /opt/hadoop/sbin/yarn-daemon.sh start resourcemanager

while true; do echo my daemonized container; sleep 1; done
