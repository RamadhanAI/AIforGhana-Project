# ---------- Build Frontend ----------
FROM node:20 AS frontend
WORKDIR /app
COPY aiforghana-next ./aiforghana-next
RUN cd aiforghana-next && npm ci && npm run build

# ---------- Build Backend ----------
FROM python:3.11-slim AS backend
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc g++ python3-dev git curl \
 && rm -rf /var/lib/apt/lists/*

COPY aiforghana-helpdesk/requirements.txt .
RUN pip install --no-cache-dir --prefer-binary -r requirements.txt \
    --extra-index-url https://download.pytorch.org/whl/cpu

COPY aiforghana-helpdesk/aiforghana_helpdesk_api ./aiforghana_helpdesk_api

# ---------- Final Image ----------
FROM python:3.11-slim
WORKDIR /app

COPY --from=frontend /app/aiforghana-next/.next ./frontend
COPY --from=frontend /app/aiforghana-next/public ./frontend/public

COPY --from=backend /app/aiforghana_helpdesk_api ./aiforghana_helpdesk_api
COPY --from=backend /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

EXPOSE 8000
CMD ["uvicorn", "aiforghana_helpdesk_api.main:app", "--host", "0.0.0.0", "--port", "8000"]

