FROM n8nio/n8n:2.1.4

USER root
RUN if command -v apk >/dev/null 2>&1; then \
      apk add --no-cache curl ca-certificates; \
    else \
      apt-get update && \
      apt-get install -y --no-install-recommends curl ca-certificates && \
      rm -rf /var/lib/apt/lists/*; \
    fi

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

