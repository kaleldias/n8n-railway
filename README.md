# 🚀 n8n Scalable Railway Template

This project provides a **production-grade, scalable n8n setup** optimized for the Railway platform.  
It includes a multi-service architecture designed for performance, fault-tolerance, and high-throughput automation workloads.

---

## 📌 Features

- **Editor Service** – Main n8n interface  
- **Worker Service** – Dedicated workflow execution workers  
- **Webhook Service** – High-performance webhook processing endpoint  
- **PostgreSQL** – Persistent workflow and credential storage  
- **Valkey (Redis)** – Queue backend for distributed job execution  
- **Automatic Secrets** – Encryption keys generated automatically  
- **Fully Isolated Services** – Editor, Worker, Webhook all managed independently  

---

## 🧩 Architecture Overview

Editor → Worker → Webhook  
└── PostgreSQL  
└── Valkey (Redis)

yaml  
Copiar código

- **Editor** handles UI, workflows, credentials, and manual executions  
- **Worker** executes jobs asynchronously using queue-based execution  
- **Webhook** receives external HTTP callbacks at scale  
- **PostgreSQL** stores workflows, executions, credentials  
- **Valkey** powers distributed execution via BullMQ queues  

---

## 🔧 Environment Variables

### Automatically Generated / Provided by Railway
- Database host, port, user, password  
- Redis (Valkey) host, port, password  
- Public domain references  
- Encryption key (`${{secret(64)}}`)

### User-Provided (SMTP)
- `N8N_SMTP_HOST`  
- `N8N_SMTP_PORT`  
- `N8N_SMTP_USER`  
- `N8N_SMTP_PASS`  
- `N8N_SMTP_SENDER`  
- `N8N_EMAIL_MODE` (default: smtp)

All other environment variables are preconfigured for a secure and scalable deployment.

---

## 🚀 Deployment

1. Click **Deploy on Railway**  
2. Railway automatically provisions:
   - Editor, Worker, Webhook
   - PostgreSQL
   - Valkey (Redis)
3. Fill in only the required SMTP fields  
4. Your automation platform is ready

---

## 🛡 Security

- Credentials encrypted using a **64-byte encryption key**  
- Secure cookies enabled  
- Production process hardening enabled  
- Public API endpoints disabled by default  
- Database SSL enabled  

---

## 🧑‍💻 Maintainer

Built and maintained by **Kal-EL Dias**.  
Ready to scale your automations — enjoy your new production-ready n8n setup!