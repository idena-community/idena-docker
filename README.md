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

## 🛡️ Security & VPS Configuration

**⚠️ Important:** If you are running this node on a **VPS** or a server with a public IP address, **do not expose port 9009** to the internet.

### For VPS Users
1. **Modify your configuration** to bind the API port to `localhost` only.
   - If using **Docker Compose**, update your `docker-compose.yml`:
     ```yaml
     ports:
       - "127.0.0.1:9009:9009"
     ```
   - If using **Docker Run**, use `-p 127.0.0.1:9009:9009`.

2. **Connect via SSH Tunnel**
   To connect your local Idena App to your secure VPS node, run this command on your computer:
   ```bash
   ssh -L 9009:127.0.0.1:9009 user@your-vps-ip

Then set your Idena Node settings to http://localhost:9009.

### For Local/Home Users
If running locally behind a home router, the default configuration (0.0.0.0:9009 or just -p 9009:9009) is safe and recommended for easier access.

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
