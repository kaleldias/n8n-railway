FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache curl ca-certificates

HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD curl -fsS http://127.0.0.1:5678/healthz || exit 1

COPY entrypoint.sh /apps-entrypoint.sh
RUN chmod +x /apps-entrypoint.sh

USER node
ENV PATH="/usr/local/bin:${PATH}"
ENV N8N_USER_FOLDER="/home/node/.n8n" \
    N8N_PORT=5678

EXPOSE 5678
ENTRYPOINT ["/apps-entrypoint.sh"]
CMD ["n8n"] 
