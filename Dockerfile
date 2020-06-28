FROM ubuntu

LABEL maintainer="jonifen"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vim zip curl mono-complete && \
    apt-get clean

RUN mkdir /tmp/terraria && \
    cd /tmp/terraria && \
    curl -sL https://www.terraria.org/system/dedicated_servers/archives/000/000/039/original/terraria-server-1405.zip --output terraria-server-1405.zip && \
    unzip -q terraria-server-1405.zip && \
    mv */Linux /terraria && \
    rm -R /tmp/* && \
    rm /terraria/Mono.* && \
    rm /terraria/System.* && \
    rm /terraria/WindowsBase.dll && \
    chmod +x /terraria/TerrariaServer* && \
    if [ ! -f /terraria/TerrariaServer ]; then echo "Missing /terraria/TerrariaServer"; exit 1; fi

COPY run-server.sh /terraria/run.sh

WORKDIR /terraria
CMD ["./run.sh"]
