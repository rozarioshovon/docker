FROM openjdk:8-alpine
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

# install ssh
RUN apk update && \
    apk add sudo bash openssh && \
    mkdir -p ~root/.ssh && chmod 700 ~root/.ssh/ && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config && \
    cp -a /etc/ssh /etc/ssh.cache && \
    rm -rf /var/cache/apk/*

# config ssh
RUN ssh-keygen -A
RUN ssh-keygen -f ~root/.ssh/id_rsa -t rsa -b 2048 -N ''
RUN mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
