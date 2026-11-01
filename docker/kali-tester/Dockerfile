FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        iproute2 \
        iputils-ping \
        net-tools \
        nmap \
        tcpdump \
        iperf3 \
        curl \
        netcat-openbsd \
        procps \
        nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /usr/local/bin/start-kali.sh

RUN chmod +x /usr/local/bin/start-kali.sh

CMD ["/usr/local/bin/start-kali.sh"]
