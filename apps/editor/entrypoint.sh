#!/usr/bin/env sh
set -e
echo "[editor] PATH=$PATH"
command -v n8n || { echo "[editor] ERRO: n8n não encontrado no PATH"; env; exit 127; }

mkdir -p "${N8N_USER_FOLDER:-/home/node/.n8n}" || true
chown -R node:node "${N8N_USER_FOLDER:-/home/node/.n8n}" || true

# se o volume "escondeu" o arquivo, repõe
if [ -f /n8n/certs/pg-ca.pem ] && [ ! -f /home/node/.n8n/pg-ca.pem ]; then
  cp /n8n/certs/pg-ca.pem /home/node/.n8n/pg-ca.pem
  chown node:node /home/node/.n8n/pg-ca.pem
fi

exec "$@"
