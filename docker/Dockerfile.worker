# Base oficial do n8n
FROM n8nio/n8n:latest

# Opcional: utilitários mínimos (alguns nós úteis usam curl/ca-certificates)
USER root
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Entrypoint do worker
COPY docker/entrypoint-worker.sh /docker-entrypoint-worker.sh
RUN chmod +x /docker-entrypoint-worker.sh

# Volta para usuário padrão
USER node

# Pasta de dados (não precisa volume no worker)
ENV N8N_USER_FOLDER="/home/node/.n8n"

ENTRYPOINT ["/docker-entrypoint-worker.sh"]
# Comando padrão do container do Worker
CMD ["n8n", "worker"]
