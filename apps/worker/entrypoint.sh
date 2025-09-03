#!/usr/bin/env sh
set -e

echo "[worker] PATH=$PATH"
command -v n8n || { echo "[worker] ERRO: n8n não encontrado no PATH"; env; exit 127; }

mkdir -p "${N8N_USER_FOLDER:-/home/node/.n8n}" || true
chown -R node:node "${N8N_USER_FOLDER:-/home/node/.n8n}" || true

exec "$@"
