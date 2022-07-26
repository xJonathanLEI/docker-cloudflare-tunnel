#!/bin/sh

if [ -z "${CLOUDFLARE_ACCOUNT_ID}" ]; then
  echo "CLOUDFLARE_ACCOUNT_ID not set"
  exit 1
fi

if [ -z "${CLOUDFLARE_TUNNEL_ID}" ]; then
  echo "CLOUDFLARE_TUNNEL_ID not set"
  exit 1
fi

if [ -z "${CLOUDFLARE_TUNNEL_SECRET}" ]; then
  echo "CLOUDFLARE_TUNNEL_SECRET not set"
  exit 1
fi

if [ -z "${TARGET_URL}" ]; then
  echo "TARGET_URL not set"
  exit 1
fi

mkdir ~/.cloudflared

echo "{\"AccountTag\":\"${CLOUDFLARE_ACCOUNT_ID}\",\"TunnelSecret\":\"${CLOUDFLARE_TUNNEL_SECRET}\",\"TunnelID\":\"${CLOUDFLARE_TUNNEL_ID}\"}" > ~/.cloudflared/${CLOUDFLARE_TUNNEL_ID}.json

echo "url: ${TARGET_URL}" > ~/.cloudflared/config.yml
echo "tunnel: ${CLOUDFLARE_TUNNEL_ID}" >> ~/.cloudflared/config.yml
echo "credentials-file: /root/.cloudflared/${CLOUDFLARE_TUNNEL_ID}.json" >> ~/.cloudflared/config.yml

exec cloudflared tunnel --no-autoupdate run ${CLOUDFLARE_TUNNEL_ID}
