FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        strongswan \
        strongswan-starter \
        strongswan-pki \
        iproute2 \
        iputils-ping \
        tcpdump \
        procps \
        net-tools \
        vim \
        nano && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /usr/local/bin/start-ipsec.sh

RUN chmod +x /usr/local/bin/start-ipsec.sh

CMD ["/usr/local/bin/start-ipsec.sh"]
