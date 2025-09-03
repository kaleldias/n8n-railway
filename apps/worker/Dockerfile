# Base oficial do n8n
FROM n8nio/n8n:latest

# Certificados (útil p/ TLS em nós HTTP)
USER root
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Entrypoint do worker (arquivo está no mesmo diretório do Dockerfile)
COPY entrypoint.sh /apps-entrypoint.sh
RUN chmod +x /apps-entrypoint.sh

# Volta para usuário padrão
USER node

# Pasta de dados (stateless, sem volume)
ENV N8N_USER_FOLDER="/home/node/.n8n"

ENTRYPOINT ["/apps-entrypoint.sh"]
# Comando padrão do container do Worker
CMD ["n8n", "worker"]
