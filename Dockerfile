FROM debian:stable-slim
RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN wget https://github.com/idena-network/idena-go/releases/download/v1.1.2/idena-node-linux-1.1.2 -O idena-node
RUN chmod +x idena-node
EXPOSE 9009 40405
ENTRYPOINT ["./idena-node"]