# 🇬🇭 AIforGhana Project

A multilingual, AI-powered smart complaint system designed to empower Ghanaian citizens to report public issues across health, education, roads, utilities, and transport — in their own language.

> ✊🏽 “Accessible civic technology for every voice — no matter the language.”

---

## 🌍 Features

- 🧠 **Multilingual Complaint Classification**: Supports Twi, Hausa, Arabic, Dagbanli, and English
- 🌐 **Real-time Language Detection & Translation** via NLLB-200
- 📍 **Location-aware Routing** + Regional Heatmaps
- 🗂️ **Category-based Analysis** (Education, Health, Roads, Utilities, Transport)
- 🔄 **Complaint Timeline Tracking** (Submitted → Processing → Routed → Resolved)
- 📊 **Admin Dashboard with Weekly & Category Insights**
- 🚀 **Fully Dockerized** for simple deployment anywhere

---

## 🏗 Architecture Overview

| Component    | Tech Stack                                |
|--------------|--------------------------------------------|
| Frontend     | React (Next.js), Tailwind CSS              |
| Backend      | FastAPI, Transformers, PostgreSQL          |
| AI Models    | HuggingFace (NLLB-200, DistilBERT)         |
| Containerization | Docker, Docker Compose               |
| Deployment   | Render / GHCR / Any Docker-compatible host|

---

## 🚀 Getting Started

### 1️⃣ Clone the Project

```bash
git clone git@github.com:RamadhanAI/AIforGhana-Project.git
cd AIforGhana-Project

 Set Up Environment Variables
cp .env.example .env
Fill in the values for:

DB_USER, DB_PASSWORD, DB_NAME, DB_HOST, HF_HOME, etc.
3️⃣ Run Locally with Docker
docker compose up --build
The backend will run at http://localhost:8000
The frontend will be accessible at http://localhost:3000

🧪 API Endpoints (FastAPI)

Endpoint	Description
POST /api/submit/	Submit a complaint
POST /api/detect	Detect complaint language
POST /api/lang/translate	Translate text
POST /api/classify/	Classify complaint category
GET /api/status/{id}	Get complaint status + timeline
POST /api/predict	Chatbot interaction
🔐 Admin Dashboard

Access analytics, category stats, weekly trends, and heatmaps
Secured via x-api-key header
Admin Endpoint	Description
GET /api/admin/analytics/summary	Total complaints overview
GET /api/admin/analytics/categories	Category-wise breakdown
GET /api/admin/analytics/weekly	Weekly trends
GET /api/admin/analytics/regions	Regional distribution
📁 Project Structure

AIforGhana-Project/
├── aiforghana-next/               # Frontend (Next.js)
├── aiforghana-helpdesk/          # Backend (FastAPI)
├── model_cache/                  # Cached models (offline support)
├── docker-compose.yml            # Combined services
├── Dockerfile                    # Unified project image
└── .github/workflows/ci.yml      # GitHub Actions (Docker build & lint)
🤝 Contributing

We welcome contributions to make this project better for everyone.

Please read the CONTRIBUTING.md guide.

🧪 Testing & CI

This project includes:

Linting and validation
Docker image build check
Healthcheck for backend
Triggered via GitHub Actions on every push or pull_request.

🧠 Powered By

Hugging Face Transformers 🤗
NLLB-200 by Meta AI 🌍
Uvicorn, FastAPI, Next.js, PostgreSQL
Docker + GitHub Actions
💡 License

MIT License © 2025 Ramadhan Hussein

“For every voice unheard, a line of code can speak.” – AIforGhana Vision
