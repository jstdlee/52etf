#!/usr/bin/env bash
# Automated Cloudflare DNS + SSL + Agent Content-Negotiation Worker setup for 52etf.net
# Usage: CLOUDFLARE_API_TOKEN="<token_with_access_to_52etf.net>" ./cloudflare/setup-cf-52etf.sh
set -euo pipefail

if [[ -z "${CLOUDFLARE_API_TOKEN:-}" ]]; then
  echo "Error: CLOUDFLARE_API_TOKEN is not set" >&2
  exit 1
fi

CF_API="https://api.cloudflare.com/client/v4"
AUTH_HEADER="Authorization: Bearer ${CLOUDFLARE_API_TOKEN}"

echo "[1/5] Locating Zone ID for 52etf.net..."
ZONE_JSON=$(curl -s -H "$AUTH_HEADER" "${CF_API}/zones?name=52etf.net")
ZONE_ID=$(echo "$ZONE_JSON" | jq -r '.result[0].id // empty')
ACCOUNT_ID=$(echo "$ZONE_JSON" | jq -r '.result[0].account.id // empty')

if [[ -z "$ZONE_ID" ]]; then
  echo "Error: Zone 52etf.net not found in the Cloudflare account accessible by this token." >&2
  echo "Visible zones on this token:" >&2
  curl -s -H "$AUTH_HEADER" "${CF_API}/zones" | jq -r '.result[] | "  - \(.name) (id=\(.id), account=\(.account.name), ns=\(.name_servers | join(",")))"' >&2
  exit 1
fi

echo "Found 52etf.net: zone_id=${ZONE_ID}, account_id=${ACCOUNT_ID}"

echo "[2/5] Setting Zone SSL mode to 'full'..."
curl -s -X PATCH -H "$AUTH_HEADER" -H "Content-Type: application/json" \
  "${CF_API}/zones/${ZONE_ID}/settings/ssl" \
  --data '{"value":"full"}' | jq '{success: .success, value: .result.value}'

echo "[3/5] Upserting proxied CNAME records (@ -> jstdlee.github.io, www -> jstdlee.github.io)..."
for NAME in "52etf.net" "www.52etf.net"; do
  EXISTING_ID=$(curl -s -H "$AUTH_HEADER" "${CF_API}/zones/${ZONE_ID}/dns_records?name=${NAME}" | jq -r '.result[0].id // empty')
  PAYLOAD=$(jq -nc --arg name "$NAME" '{type:"CNAME", name:$name, content:"jstdlee.github.io", ttl:1, proxied:true}')
  if [[ -n "$EXISTING_ID" ]]; then
    curl -s -X PUT -H "$AUTH_HEADER" -H "Content-Type: application/json" \
      "${CF_API}/zones/${ZONE_ID}/dns_records/${EXISTING_ID}" --data "$PAYLOAD" | jq '{action:"updated", name:.result.name, type:.result.type, content:.result.content, proxied:.result.proxied}'
  else
    curl -s -X POST -H "$AUTH_HEADER" -H "Content-Type: application/json" \
      "${CF_API}/zones/${ZONE_ID}/dns_records" --data "$PAYLOAD" | jq '{action:"created", name:.result.name, type:.result.type, content:.result.content, proxied:.result.proxied}'
  fi
done

echo "[4/5] Deploying Cloudflare Agent Content-Negotiation Worker (52etf-agent)..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
METADATA='{"main_module":"agent-negotiation-worker.js","compatibility_date":"2026-01-01"}'
curl -s -X PUT -H "$AUTH_HEADER" \
  "${CF_API}/accounts/${ACCOUNT_ID}/workers/scripts/52etf-agent" \
  -F "metadata=${METADATA};type=application/json" \
  -F "agent-negotiation-worker.js=@${SCRIPT_DIR}/agent-negotiation-worker.js;type=application/javascript+module" | jq '{success:.success, id:.result.id}'

echo "[5/5] Binding Worker routes (52etf.net/* and www.52etf.net/*)..."
for PATTERN in "52etf.net/*" "www.52etf.net/*"; do
  curl -s -X POST -H "$AUTH_HEADER" -H "Content-Type: application/json" \
    "${CF_API}/zones/${ZONE_ID}/workers/routes" \
    --data "{\"pattern\":\"${PATTERN}\",\"script\":\"52etf-agent\"}" | jq '{success:.success, result:.result, errors:.errors}'
done

echo "Done! Verifying https://52etf.net/..."
