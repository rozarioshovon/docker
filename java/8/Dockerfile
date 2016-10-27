FROM openjdk:8
MAINTAINER khkwon<kiheng.kwon@monstar-lab.com>

# install ssh
RUN apt-get update && \
    apt-get install -y sudo vim openssh-server && \
    mkdir -p ~root/.ssh && chmod 700 ~root/.ssh/ && \
    cp -a /etc/ssh /etc/ssh.cache && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i "9s/^/#/" /etc/sudoers
RUN sed -i "11s/^/#/" /etc/sudoers

# config ssh
RUN ssh-keygen -A
RUN ssh-keygen -f ~root/.ssh/id_rsa -t rsa -b 2048 -N ''
RUN mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
