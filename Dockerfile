# ---------- build frontend ----------
FROM node:20 AS frontend
WORKDIR /app
COPY aiforghana-next ./aiforghana-next
RUN cd aiforghana-next && npm ci && npm run build

# ---------- build backend ----------
FROM python:3.11-slim AS backend
WORKDIR /app
COPY aiforghana-helpdesk/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY aiforghana-helpdesk/aiforghana_helpdesk_api ./aiforghana_helpdesk_api

# ---------- final image ----------
FROM python:3.11-slim
WORKDIR /app

# FE assets
COPY --from=frontend /app/aiforghana-next/.next ./frontend
COPY --from=frontend /app/aiforghana-next/public ./frontend/public

# BE app + Python packages
COPY --from=backend /app/aiforghana_helpdesk_api ./aiforghana_helpdesk_api
COPY --from=backend /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

EXPOSE 8000
CMD ["uvicorn", "aiforghana_helpdesk_api.main:app", "--host", "0.0.0.0", "--port", "8000"]

