#!/bin/sh

# hdfs setting
sudo -u hdfs hdfs namenode -format

sudo -u hdfs /opt/hadoop/sbin/hadoop-daemon.sh start namenode
sudo -u yarn /opt/hadoop/sbin/yarn-daemon.sh start resourcemanager

# configure hbase 
sudo -u hdfs hadoop fs -mkdir /hbase
sudo -u hdfs hadoop fs -chown -R hbase:supergroup /hbase

sudo -u hbase /opt/hbase/bin/hbase-daemon.sh start master

while true; do echo my daemonized container; sleep 1; done
