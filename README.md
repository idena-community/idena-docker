# Idena Node Docker

A simple and lightweight Docker image to run an [Idena](https://idena.io/) node.

## 🚀 Usage

Run this single command to start the node:
**Note:** Please adjust the ports and volume paths to fit your specific needs.

```bash
docker run -d \
  --name idena-node \
  --restart unless-stopped \
  -p 9009:9009 \
  -p 40405:40405 \
  -v idena-data:/app/datadir \
  morienzo/idena-node:latest --datadir=/app/datadir