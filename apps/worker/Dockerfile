# Imagem oficial do n8n
FROM n8nio/n8n:1.121.3

# Instala certificados (útil para conexões HTTPS nos nodes)
USER root
RUN apk add --no-cache ca-certificates

# Entrypoint exclusivo do worker
COPY entrypoint.sh /n8n/worker/entrypoint.sh
RUN chmod +x /n8n/worker/entrypoint.sh

# Volta para usuário padrão
USER node

# Worker é stateless, mas alguns nodes ainda usam /home/node/.n8n em runtime
ENV N8N_USER_FOLDER="/home/node/.n8n"

ENTRYPOINT ["/n8n/worker/entrypoint.sh"]

