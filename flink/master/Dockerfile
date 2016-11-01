FROM khkwon/hadoop/base 
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

# master node setting
RUN mkdir -p /data/1/dfs/nn \
    && chown -R hdfs:supergroup /data/1/dfs/nn \
    && chmod 700 /data/1/dfs/nn

ADD hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml

EXPOSE 8081

ADD run.sh /root/run.sh
CMD /root/run.sh
