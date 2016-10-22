#!/bin/sh

sudo -u hdfs /opt/hadoop/sbin/hadoop-daemon.sh start namenode
sudo -u hdfs yarn resourcemanager

