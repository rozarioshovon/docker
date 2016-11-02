#!/bin/sh

/usr/sbin/sshd

sed -i "s/%HADOOP_NAMENODE_URI%/${HADOOP_NAMENODE_URI}/g" /opt/hadoop/etc/hadoop/core-site.xml

sed -i "s/%HADOOP_NAMENODE_URI%/${HADOOP_NAMENODE_URI}/g" /opt/hadoop/etc/hadoop/yarn-site.xml
sed -i "s/%HADOOP_NAMENODE_URI%/${HADOOP_NAMENODE_URI}/g" /opt/hbase/conf/hbase-site.xml

exec "$@"
