#!/bin/sh

sudo -u hdfs /opt/hadoop/sbin/hadoop-daemon.sh start datanode
sudo -u hdfs /opt/hadoop/sbin/yarn-daemon.sh start nodemanager
sudo -u hbase /opt/hbase/bin/hbase-daemon.sh start regionserver
/opt/drill/bin/drillbit.sh start

while true; do echo my daemonized container; sleep 1; done
