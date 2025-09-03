# Imagem oficial do n8n
FROM n8nio/n8n:latest

# Instala certificados (útil para conexões HTTPS nos nodes)
USER root
RUN apk add --no-cache ca-certificates

# Entrypoint exclusivo do worker
COPY entrypoint.sh /apps-entrypoint.sh
RUN chmod +x /apps-entrypoint.sh

# Volta para usuário padrão
USER node
ENV PATH="/usr/local/bin:${PATH}"

# Worker é stateless, mas alguns nodes ainda usam /home/node/.n8n em runtime
ENV N8N_USER_FOLDER="/home/node/.n8n"

ENTRYPOINT ["/apps-entrypoint.sh"]
CMD ["n8n", "worker"]   # Executa só o processador de fila
