#!/usr/bin/env sh
set -e

# Garante diretório para eventuais cache/credenciais em memória
mkdir -p "${N8N_USER_FOLDER:-/home/node/.n8n}" || true
chown -R node:node "${N8N_USER_FOLDER:-/home/node/.n8n}" || true

# Sobe o processo de worker
exec "$@"
