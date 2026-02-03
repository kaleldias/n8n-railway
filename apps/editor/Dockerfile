FROM n8nio/n8n:2.6.3 

USER root
# Base image nao tem gerenciador de pacotes; evita instalar aqui.

HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD node -e "const http=require('http');const req=http.get('http://127.0.0.1:5678/healthz',res=>{res.resume();process.exit(res.statusCode===200?0:1);});req.on('error',()=>process.exit(1));"

# 1) Copia o entrypoint
COPY entrypoint.sh /n8n/editor/entrypoint.sh
RUN chmod +x /n8n/editor/entrypoint.sh

USER node
ENV N8N_USER_FOLDER="/home/node/.n8n" \
    N8N_PORT=5678

EXPOSE 5678
ENTRYPOINT ["/n8n/editor/entrypoint.sh"]

