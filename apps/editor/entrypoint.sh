#!/usr/bin/env sh
set -e

echo "[editor] PATH=$PATH"
command -v n8n || { echo "[editor] ERRO: n8n não encontrado no PATH"; env; exit 127; }

# garante diretório de dados (que pode ser volume)
mkdir -p "${N8N_USER_FOLDER:-/home/node/.n8n}" || true
chown -R node:node "${N8N_USER_FOLDER:-/home/node/.n8n}" || true

# Se a CA existir fora do volume e não existir dentro do volume, copia pra lá também.
# (isso ajuda se você configurou DB_POSTGRESDB_SSL_CA apontando para /home/node/.n8n/pg-ca.pem)
if [ -f /n8n/certs/pg-ca.pem ] && [ ! -f "${N8N_USER_FOLDER:-/home/node/.n8n}/pg-ca.pem" ]; then
  echo "[editor] Copiando CA para ${N8N_USER_FOLDER:-/home/node/.n8n}/pg-ca.pem"
  cp /n8n/certs/pg-ca.pem "${N8N_USER_FOLDER:-/home/node/.n8n}/pg-ca.pem"
  chown node:node "${N8N_USER_FOLDER:-/home/node/.n8n}/pg-ca.pem"
fi

# Log útil: qual CA vamos usar se a env estiver setada
if [ -n "${DB_POSTGRESDB_SSL_CA:-}" ]; then
  echo "[editor] DB_POSTGRESDB_SSL_CA=${DB_POSTGRESDB_SSL_CA}"
  [ -f "${DB_POSTGRESDB_SSL_CA}" ] || echo "[editor] AVISO: arquivo CA não encontrado em ${DB_POSTGRESDB_SSL_CA}"
fi

exec "$@"
