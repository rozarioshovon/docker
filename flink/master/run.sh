#!/bin/sh

echo $HADOOP_NAMENODE_URI

sudo -u hdfs hdfs namenode -format
sudo -u hdfs /opt/hadoop/sbin/hadoop-daemon.sh start namenode
sudo -u yarn /opt/hadoop/sbin/yarn-daemon.sh start resourcemanager

# create flink hdfs
sudo -u hdfs hadoop fs -mkdir -p /user/root
sudo -u hdfs hadoop fs -chown root:root /user/root
sudo -u hdfs hadoop fs -mkdir -p /user/zookeeper
sudo -u hdfs hadoop fs -chown root:root /user/zookeeper

# launch jobmanager
#/opt/flink/bin/jobmanager.sh start cluster
/opt/flink/bin/yarn-session.sh -n 1

while true; do echo my daemonized container; sleep 1; done

