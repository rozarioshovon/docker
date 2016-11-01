FROM khkwon/java:8-alpine
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

RUN wget -q http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz && \
    tar zxvf kafka_2.11-0.10.1.0.tgz && \ 
    mkdir -p /opt/ && \
    mv kafka_2.11-0.10.1.0 /opt/kafka && \
    rm -rf kafka_2.11-0.10.1.0.tgz
ENV PATH $PATH:/opt/kafka/bin

EXPOSE 9092

ADD bootstrap.sh /root/bootstrap.sh
ADD server.properties /opt/kafka/config/server.properties

CMD "/root/bootstrap.sh"
