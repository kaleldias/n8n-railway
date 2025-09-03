#!/usr/bin/env sh
set -e

mkdir -p "${N8N_USER_FOLDER:-/home/node/.n8n}" || true
chown -R node:node "${N8N_USER_FOLDER:-/home/node/.n8n}" || true

exec "$@"
