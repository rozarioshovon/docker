FROM khkwon/java:8-alpine
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

# add user
RUN addgroup -S supergroup \
  && adduser -S -D -G supergroup hdfs \
  && adduser -S -D -G supergroup spark \
  && adduser -S -D -G supergroup hive \
  && adduser -S -D -G supergroup yarn \
  && adduser -S -D -G supergroup hbase

# environment
ENV HADOOP_PREFIX /opt/hadoop
ENV HADOOP_COMMON_HOME /opt/hadoop
ENV HADOOP_HDFS_HOME /opt/hadoop
ENV HADOOP_MAPRED_HOME /opt/hadoop
ENV HADOOP_YARN_HOME /opt/hadoop
ENV HADOOP_YARN_HOME /opt/spark
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
ENV SPARK_HOME /opt/spark
ENV HBASE_HOME /opt/hbase

# download hadoop
ENV HADOOP_VERSION 2.7.3
RUN wget -q http://ftp.jaist.ac.jp/pub/apache/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xzf hadoop-${HADOOP_VERSION}.tar.gz && \
    mkdir -p /opt/ && \
    mv hadoop-${HADOOP_VERSION} /opt/hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz && \
    rm -rf /opt/hadoop/etc/hadoop/core-site.xml
ENV PATH ${PATH}:/opt/hadoop/bin
ADD core-site.xml.tmpl /opt/hadoop/etc/hadoop/core-site.xml
ADD yarn-site.xml.tmpl /opt/hadoop/etc/hadoop/yarn-site.xml
ADD mapred-site.xml.tmpl /opt/hadoop/etc/hadoop/mapred-site.xml
RUN mkdir -p /opt/hadoop/logs && chmod -R 777 /opt/hadoop/logs

# download & install hbase$
ENV HBASE_VERSION 0.98.23
RUN cd && \
    wget -q http://ftp.jaist.ac.jp/pub/apache/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-hadoop2-bin.tar.gz && \
    tar -xzf hbase-${HBASE_VERSION}-hadoop2-bin.tar.gz && \
    mkdir -p /opt/ && \
    mv hbase-${HBASE_VERSION}-hadoop2 /opt/hbase && \
    rm hbase-${HBASE_VERSION}-hadoop2-bin.tar.gz
RUN chmod +x /opt/hbase/bin/*
ENV PATH $PATH:/opt/hbase/bin
RUN sed -i '/^# export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk:' /opt/hbase/conf/hbase-env.sh
RUN mkdir -p /opt/hbase/logs && chmod -R 777 /opt/hbase/logs
ADD hbase-site.xml.tmpl /opt/hbase/conf/hbase-site.xml
ADD hbase-replace-jar.sh /tmp/hbase-replace-jar.sh
RUN /tmp/hbase-replace-jar.sh && rm /tmp/hbase-replace-jar.sh
RUN wget -P /opt/hbase/lib http://central.maven.org/maven2/org/apache/hadoop/hadoop-client/2.7.3/hadoop-client-2.7.3.jar && \
    rm /opt/hbase/lib/hadoop-client-2.2.0.jar

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk\nexport HADOOP_PREFIX=/opt/hadoop\nexport HADOOP_HOME=/opt/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# ENTRYPOINT
ADD entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
