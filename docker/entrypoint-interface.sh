#!/usr/bin/env sh
set -e

# Apenas para garantir que a pasta de dados exista com permissão correta
mkdir -p "${N8N_USER_FOLDER:-/home/node/.n8n}"
chown -R node:node "${N8N_USER_FOLDER:-/home/node/.n8n}" || true

# Executa o n8n (editor + webhooks)
exec "$@"
