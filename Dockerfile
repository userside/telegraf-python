FROM telegraf:latest

WORKDIR /app

RUN set -eux; \
    apt-get update; \
    apt-get install -y python3 python3-requests python3-psutil; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8125/udp 8092/udp 8094
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
