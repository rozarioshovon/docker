FROM openjdk:8-alpine

# install base tool
RUN apk update && apk upgrade && apk add --no-cache bash git

# Installs Ant
ENV ANT_VERSION 1.9.4
RUN cd && \
    wget -q http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mkdir -p /opt/ && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

RUN mkdir /tmp/zookeeper
WORKDIR /tmp/zookeeper
RUN git clone https://github.com/apache/zookeeper.git .
RUN git checkout release-3.5.1-rc2
RUN ant jar
RUN cp /tmp/zookeeper/conf/zoo_sample.cfg /tmp/zookeeper/conf/zoo.cfg
RUN echo "standaloneEnabled=false" >> /tmp/zookeeper/conf/zoo.cfg
RUN echo "dynamicConfigFile=/tmp/zookeeper/conf/zoo.cfg.dynamic" >> /tmp/zookeeper/conf/zoo.cfg
ADD zk-init.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/zk-init.sh"]
