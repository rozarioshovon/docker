#!/bin/sh

/usr/sbin/sshd

sed -i 's/%HADOOP_NAMENODE_URI%/namenode/g' /opt/hadoop/etc/hadoop/core-site.xml
sed -i 's/%HADOOP_NAMENODE_URI%/namenode/g' /opt/hadoop/etc/hadoop/yarn-site.xml

exec "$@"
