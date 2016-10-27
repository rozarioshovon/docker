#!/bin/sh

/etc/init.d/ssh start

sed -i 's/%HADOOP_NAMENODE_URI%/namenode/g' /opt/hadoop/etc/hadoop/core-site.xml
sed -i 's/%HADOOP_NAMENODE_URI%/namenode/g' /opt/hadoop/etc/hadoop/yarn-site.xml
sed -i 's/%HADOOP_NAMENODE_URI%/namenode/g' /opt/hbase/conf/hbase-site.xml

exec "$@"
