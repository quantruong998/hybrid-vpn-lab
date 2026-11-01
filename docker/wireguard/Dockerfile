FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        wireguard-tools \
        iproute2 \
        iputils-ping \
        tcpdump \
        procps \
        net-tools \
        nano \
        nmap \
        iperf3 \
        netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /usr/local/bin/start-wireguard.sh

RUN chmod +x /usr/local/bin/start-wireguard.sh

CMD ["/usr/local/bin/start-wireguard.sh"]
