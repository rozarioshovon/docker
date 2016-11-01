FROM khkwon/ubuntu:16.04
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

RUN apt-get update && apt-get install -y sudo 
RUN curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent2.sh | sh

RUN td-agent-gem install fluent-plugin-kafka

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD td-agent.conf /etc/td-agent/td-agent.conf

CMD td-agent
