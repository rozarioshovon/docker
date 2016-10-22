FROM khkwon/java:8-alpine
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

# add user
RUN addgroup -S supergroup \
  && adduser -S -D -G supergroup hdfs \
  && adduser -S -D -G supergroup spark \
  && adduser -S -D -G supergroup hive \
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
RUN wget http://ftp.jaist.ac.jp/pub/apache/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xzf hadoop-${HADOOP_VERSION}.tar.gz && \
    mkdir -p /opt/ && \
    mv hadoop-${HADOOP_VERSION} /opt/hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz && \
    rm -rf /opt/hadoop/etc/hadoop/core-site.xml
ENV PATH ${PATH}:/opt/hadoop/bin
ADD core-site.xml.tmpl /opt/hadoop/etc/hadoop/core-site.xml
ADD yarn-site.xml.tmpl /opt/hadoop/etc/hadoop/yarn-site.xml
ADD mapred-site.xml.tmpl /opt/hadoop/etc/hadoop/mapred-site.xml
ADD hbase-site.xml.tmpl /opt/hadoop/etc/hadoop/hbase-site.xml
RUN mkdir -p /opt/hadoop/logs && chmod -R 777 /opt/hadoop/logs

# download & install hbase$
# ENV HBASE_VERSION 1.2.3$
RUN cd && \
    wget -q http://ftp.jaist.ac.jp/pub/apache/hbase/1.2.3/hbase-${HBASE_VERSION}-bin.tar.gz && \
    tar -xzf hbase-${HBASE_VERSION}-bin.tar.gz && \
    mkdir -p /opt/ && \
    mv hbase-${HBASE_VERSION} /opt/hbase && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz
RUN chmod +x /opt/hbase/bin/*
ENV PATH $PATH:/opt/hbase/bin

ENV SPARK_VERSION 2.0.1
RUN wget http://ftp.jaist.ac.jp/pub/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    tar -xzf spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    mkdir -p /opt/ && \
    mv spark-${SPARK_VERSION}-bin-hadoop2.7 /opt/spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop2.7.tgz
ENV PATH ${PATH}:/opt/spark/bin
RUN mv /opt/spark/conf/spark-env.sh.template /opt/spark/conf/spark-env.sh
RUN echo "HADOOP_CONF_DIR=${HADOOP_CONF_DIR}" >> /opt/spark/conf/spark-env.sh

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk\nexport HADOOP_PREFIX=/opt/hadoop\nexport HADOOP_HOME=/opt/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# ENTRYPOINT
ADD entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
