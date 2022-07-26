# Docker for Cloudflare Tunnels

A Docker image for running Cloudflare Tunnels to expose local resources to the Internet through Cloudflare's network. Supports `linux/amd64` and `linux/arm64`.

## Docker Hub

Images are built with [GitHub Actions](https://github.com/features/actions). Built images are pushed to [Docker Hub](https://hub.docker.com/r/xjonathanlei/cloudflare-tunnel).

## Usage

Before running a Cloudflare tunnel through this image, you must first create a tunnel and save its credentials following [Cloudflare's guide](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide). You may run the container with `sh` as entrypoint for quicking getting a disposable `cloudflared` installation.

### Configuration

The container is configured through environment variables.

- `CLOUDFLARE_ACCOUNT_ID`

  Cloudflare account ID.

- `CLOUDFLARE_TUNNEL_ID`

  Tunnel ID as in the `TunnelID` field of the tunnel JSON file.

- `CLOUDFLARE_TUNNEL_SECRET`

  Tunnel secret as in the `TunnelSecret` field of the tunnel JSON file.

- `TARGET_URL`

  The URL to which traffic is redirected.

## License

[MIT](./LICENSE)
