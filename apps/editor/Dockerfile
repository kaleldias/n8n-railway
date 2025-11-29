FROM n8nio/n8n:1.121.3

USER root
RUN apk add --no-cache curl ca-certificates

HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD curl -fsS http://127.0.0.1:5678/healthz || exit 1

# 1) Copia o entrypoint
COPY entrypoint.sh /n8n/editor/entrypoint.sh
RUN chmod +x /n8n/editor/entrypoint.sh

USER node
ENV N8N_USER_FOLDER="/home/node/.n8n" \
    N8N_PORT=5678

EXPOSE 5678
ENTRYPOINT ["/n8n/editor/entrypoint.sh"]

