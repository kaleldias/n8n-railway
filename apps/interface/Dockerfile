# Imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Precisamos do curl pro healthcheck
USER root
RUN apt-get update && apt-get install -y --no-install-recommends curl \
  && rm -rf /var/lib/apt/lists/*

# Healthcheck do serviço web do n8n (porta interna 5678)
HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD curl -fsS http://127.0.0.1:5678/healthz || exit 1

# Entrypoint exclusivo da interface
COPY apps/entrypoint.sh /apps-entrypoint.sh
RUN chmod +x /apps-entrypoint.sh

# Volta para o usuário não-root padrão da imagem
USER node

# Pasta de dados/credenciais do n8n
ENV N8N_USER_FOLDER="/home/node/.n8n" \
    N8N_PORT=5678

ENTRYPOINT ["/apps-entrypoint.sh"]
# Sobe o editor/webhooks
CMD ["n8n"]
