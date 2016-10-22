#!/bin/sh

sed -i 's/%HADOOP_NAMENODE_URI%/namenode/g' /opt/hbase/conf/hbase-site.xml

sudo -u hbase hbase "$@" start


