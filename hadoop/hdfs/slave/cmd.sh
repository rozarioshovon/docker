#!/bin/sh

sudo -u hdfs /opt/hadoop/sbin/yarn-daemon.sh start nodemanager
sudo -u hdfs hadoop datanode
