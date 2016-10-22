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

ADD cmd.sh /root/cmd.sh

# hdfs port

# yarn port
EXPOSE 45454 

# hbase port
EXPOSE 60030

CMD ["/root/cmd.sh"]
