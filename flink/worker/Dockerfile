FROM khkwon/hadoop/base
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

# data node setting
RUN mkdir -p /data/1/dfs/dn \
    && chown -R hdfs:supergroup /data/1/dfs/dn
RUN mkdir -p /data/2/dfs/dn \
    && chown -R hdfs:supergroup /data/2/dfs/dn
RUN mkdir -p /data/3/dfs/dn \
    && chown -R hdfs:supergroup /data/3/dfs/dn

ADD hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml

ADD run.sh /root/run.sh
CMD /root/run.sh
