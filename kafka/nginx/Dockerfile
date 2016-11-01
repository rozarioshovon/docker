FROM khkwon/kafka/fluentd
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

RUN apt-get update && \
    apt-get install -y nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD td-agent.conf /etc/td-agent/td-agent.conf

ADD cmd.sh /root/cmd.sh

CMD ["/root/cmd.sh"]
