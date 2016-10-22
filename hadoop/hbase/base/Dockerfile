FROM khkwon/hadoop/base
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

# download & install hbase
ENV HBASE_VERSION 1.2.3
RUN cd && \
    wget -q http://ftp.jaist.ac.jp/pub/apache/hbase/1.2.3/hbase-${HBASE_VERSION}-bin.tar.gz && \
    tar -xzf hbase-${HBASE_VERSION}-bin.tar.gz && \
    mkdir -p /opt/ && \
    mv hbase-${HBASE_VERSION} /opt/hbase && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz
RUN chmod +x /opt/hbase/bin/*
ENV PATH $PATH:/opt/hbase/bin

ADD hbase-site.xml.tmpl /opt/hbase/conf/hbase-site.xml
ADD script.sh /root/script.sh

RUN sed -i '/^# export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk\nexport HADOOP_PREFIX=/opt/hadoop\nexport HADOOP_HOME=/opt/hadoop\n:' /opt/hbase/conf/hbase-env.sh

CMD ["/root/script.sh"]
