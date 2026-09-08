FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget unzip ca-certificates libicu-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /terraria

RUN wget -q https://terraria.org/api/download/pc-dedicated-server/terraria-server-1458.zip \
    -O /tmp/terraria.zip && \
    unzip -q /tmp/terraria.zip -d /tmp/terraria && \
    cp -r /tmp/terraria/1458/Linux/* /terraria/ && \
    chmod +x TerrariaServer.bin.x86_64 && \
    rm -rf /tmp/terraria /tmp/terraria.zip

COPY start.sh .

RUN chmod +x start.sh

EXPOSE 7777

CMD ["./start.sh"]
