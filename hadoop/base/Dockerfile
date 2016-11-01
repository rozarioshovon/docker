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
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
ENV YARN_CONF_DIR /opt/hadoop/etc/hadoop
ENV HADOOP_HOME /opt/hadoop
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

# download & install spark
ENV SPARK_VERSION 2.0.1
RUN wget -q http://ftp.jaist.ac.jp/pub/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    tar -xzf spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    mkdir -p /opt/ && \
    mv spark-${SPARK_VERSION}-bin-hadoop2.7 /opt/spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop2.7.tgz
ENV PATH ${PATH}:/opt/spark/bin
RUN mv /opt/spark/conf/spark-env.sh.template /opt/spark/conf/spark-env.sh
RUN echo "HADOOP_CONF_DIR=${HADOOP_CONF_DIR}" >> /opt/spark/conf/spark-env.sh

# download & install drill
ENV DRILL_VERSION 1.8.0
RUN wget -q http://ftp.meisei-u.ac.jp/mirror/apache/dist/drill/drill-${DRILL_VERSION}/apache-drill-${DRILL_VERSION}.tar.gz && \
    tar -xzf apache-drill-${DRILL_VERSION}.tar.gz && \
    mkdir -p /opt/ && \
    mv apache-drill-${DRILL_VERSION} /opt/drill && \
    rm apache-drill-${DRILL_VERSION}.tar.gz
ENV PATH ${PATH}:/opt/drill/bin
RUN apk update && \ 
    apk add libstdc++ && \
    rm -rf /var/cache/apk/*
ADD drill-override.conf /opt/drill/conf/drill-override.conf

# download & install hbase$
ENV HBASE_VERSION 1.2.3
RUN cd && \
    wget -q http://ftp.jaist.ac.jp/pub/apache/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz && \
    tar -xzf hbase-${HBASE_VERSION}-bin.tar.gz && \
    mkdir -p /opt/ && \
    mv hbase-${HBASE_VERSION} /opt/hbase && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz
RUN chmod +x /opt/hbase/bin/*
ENV PATH $PATH:/opt/hbase/bin
RUN sed -i '/^# export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk:' /opt/hbase/conf/hbase-env.sh
RUN mkdir -p /opt/hbase/logs && chmod -R 777 /opt/hbase/logs
ADD hbase-site.xml.tmpl /opt/hbase/conf/hbase-site.xml
ADD hbase-replace-jar.sh /tmp/hbase-replace-jar.sh
RUN /tmp/hbase-replace-jar.sh && rm /tmp/hbase-replace-jar.sh
RUN wget -P /opt/hbase/lib http://central.maven.org/maven2/org/apache/hadoop/hadoop-client/2.7.3/hadoop-client-2.7.3.jar && \
    rm /opt/hbase/lib/hadoop-client-2.5.1.jar

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk\nexport HADOOP_PREFIX=/opt/hadoop\nexport HADOOP_HOME=/opt/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# download Flink
ENV FLINK_VERSION 1.1.3
ENV SCALA_VERSION 2.11
RUN wget -q http://ftp.jaist.ac.jp/pub/apache/flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-hadoop27-scala_${SCALA_VERSION}.tgz && \
    tar -xzf flink-${FLINK_VERSION}-bin-hadoop27-scala_${SCALA_VERSION}.tgz && \
    mkdir -p /opt/ && \
    mv flink-1.1.3 /opt/flink && \
    rm -rf flink-1.1.3-bin-hadoop27-scala_2.11.tgz
ENV PATH $PATH:/opt/flink/bin

ADD flink-conf.yaml /opt/flink/conf/flink-conf.yaml
ADD zoo.cfg /opt/flink/conf/zoo.cfg

# MASTER
# hdfs port
EXPOSE 50070
# yarn port
EXPOSE 8025 8030 8141 8088 45454
# hbase port
EXPOSE 16010
# drill port
EXPOSE 8047
# spark port
EXPOSE 4040

# ENTRYPOINT
ADD entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
