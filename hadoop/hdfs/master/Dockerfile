FROM khkwon/hadoop/base
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

# master node setting
RUN mkdir -p /data/1/dfs/nn \
    && chown -R hdfs:supergroup /data/1/dfs/nn \
    && chmod 700 /data/1/dfs/nn

ADD hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml

RUN sudo -u hdfs hadoop namenode -format

ADD cmd.sh /root/cmd.sh

EXPOSE 50070

CMD ["/root/cmd.sh"]
