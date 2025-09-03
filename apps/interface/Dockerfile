# Imagem oficial do n8n
FROM n8nio/n8n:latest

# Instala curl + certificados (para healthcheck e TLS)
USER root
RUN apk add --no-cache curl ca-certificates

# Healthcheck do serviço web do n8n (porta interna 5678)
HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD curl -fsS http://127.0.0.1:5678/healthz || exit 1

# Entrypoint exclusivo da interface
COPY entrypoint.sh /apps-entrypoint.sh
RUN chmod +x /apps-entrypoint.sh

# Volta para usuário padrão
USER node

# Pasta persistente para credenciais, nodes instalados etc.
ENV N8N_USER_FOLDER="/home/node/.n8n" \
    N8N_PORT=5678

EXPOSE 5678
ENTRYPOINT ["/apps-entrypoint.sh"]
CMD ["n8n"]   # Executa o editor + API + webhooks
