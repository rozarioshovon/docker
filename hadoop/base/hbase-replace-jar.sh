#!/bin/bash

target=`find /opt/hbase/lib -name "*.jar" | sed 's!^.*/!!' | grep -E ^hadoop`

for i in $target
do
  hadoop_jar=`echo $i | sed -e 's/2.2.0/2.7.3/'`
  result=`find /opt/hadoop/share/hadoop/hdfs -name $hadoop_jar`
  if [ -n "$result" ]; then
    cp $result /opt/hbase/lib
    rm -rf /opt/hbase/lib/$i
  fi
done

for i in $target
do
  hadoop_jar=`echo $i | sed -e 's/2.2.0/2.7.3/'`
  result=`find /opt/hadoop/share/hadoop/mapreduce -name $hadoop_jar`
  if [ -n "$result" ]; then
    cp $result /opt/hbase/lib
    rm -rf /opt/hbase/lib/$i
  fi
done

for i in $target
do
  hadoop_jar=`echo $i | sed -e 's/2.2.0/2.7.3/'`
  result=`find /opt/hadoop/share/hadoop/yarn -name $hadoop_jar`
  if [ -n "$result" ]; then
    cp $result /opt/hbase/lib
    rm -rf /opt/hbase/lib/$i
  fi
done

for i in $target
do
  hadoop_jar=`echo $i | sed -e 's/2.2.0/2.7.3/'`
  result=`find /opt/hadoop/share/hadoop/common -name $hadoop_jar`
  if [ -n "$result" ]; then
    cp $result /opt/hbase/lib
    rm -rf /opt/hbase/lib/$i
  fi
done
