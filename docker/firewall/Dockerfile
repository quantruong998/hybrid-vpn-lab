FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        nftables \
        iproute2 \
        iputils-ping \
        tcpdump \
        procps \
        net-tools \
        nano && \
    rm -rf /var/lib/apt/lists/*

COPY nftables.conf /etc/nftables.conf
COPY start.sh /usr/local/bin/start-firewall.sh

RUN chmod +x /usr/local/bin/start-firewall.sh

CMD ["/usr/local/bin/start-firewall.sh"]
