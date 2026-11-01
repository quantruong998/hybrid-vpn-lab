FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        iproute2 \
        iputils-ping \
        tcpdump \
        netcat-openbsd \
        iperf3 \
        curl \
        procps \
        nano && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /usr/local/bin/start-node.sh

RUN chmod +x /usr/local/bin/start-node.sh

CMD ["/usr/local/bin/start-node.sh"]
