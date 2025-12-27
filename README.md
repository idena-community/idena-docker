# Idena Node Docker

A simple and lightweight Docker image to run an [Idena](https://idena.io/) node.

## 🚀 Usage

Run this single command to start the node. This configuration exposes the RPC API and optimizes the node for a server environment:

**Note:** Please adjust the ports and volume paths to fit your specific needs.

```bash
docker run -d \
  --name idena-node \
  --restart unless-stopped \
  -p 9009:9009 \
  -p 40405:40405 \
  -v idena-data:/app/datadir \
  morienzo/idena-node:latest \
  --datadir=/app/datadir \
  --rpcaddr=0.0.0.0 \
  --profile=server
```

### Parameters explained:

--rpcaddr=0.0.0.0: Allows accessing the node API from outside the container (required if you want to connect your Idena App to this node).
--profile=server: Optimizes IPFS for VPS/Server usage (prevents local network scanning).

## 🔑 API Key Management
To connect your Idena client to this node, you will need the API Key.

### How to get the current API Key
The node generates a random API key automatically upon the first start. You can retrieve it with the following command:

```bash

docker exec idena-node cat /app/datadir/api.key
```
### How to set a custom API Key
If you prefer to define your own API key (e.g., for easier configuration), add the --apikey parameter to your Docker command:

```bash

docker run -d \
  --name idena-node \
  --restart unless-stopped \
  -p 9009:9009 \
  -p 40405:40405 \
  -v idena-data:/app/datadir \
  morienzo/idena-node:latest \
  --datadir=/app/datadir \
  --rpcaddr=0.0.0.0 \
  --profile=server \
  --apikey="YOUR_CUSTOM_KEY_HERE"
```
