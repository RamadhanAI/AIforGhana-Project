# AIforGhana Project

AIforGhana is a civic-tech initiative leveraging Artificial Intelligence and Blockchain to empower Ghanaian governance through transparency, accountability, and citizen engagement.

This repository acts as the **monorepo root** that includes two key components as **Git submodules**:

- [`aiforghana-helpdesk`](https://github.com/RamadhanAI/aiforghana-helpdesk) — Backend API and services  
- [`aiforghana-next`](https://github.com/RamadhanAI/aiforghana-next) — Frontend Next.js application  

---

## Repository Structure

AIforGhana-Project/
├── aiforghana-helpdesk/ # Backend service (submodule)
└── aiforghana-next/ # Frontend app (submodule)


Each submodule is a separate Git repository and is versioned independently.

---

## Getting Started

### Clone with submodules

To clone this repo including submodules, use:

```bash
git clone --recurse-submodules https://github.com/RamadhanAI/AIforGhana-Project.git
Or if you already cloned without --recurse-submodules, initialize submodules with:

git submodule update --init --recursive
Updating submodules
To pull the latest changes in each submodule, run:

git submodule update --remote --merge
Running the Backend
Navigate to the backend folder:
cd aiforghana-helpdesk
Follow the backend README instructions to install dependencies and start the API server.
Running the Frontend
Navigate to the frontend folder:
cd aiforghana-next
Follow the frontend README instructions to install dependencies and run the Next.js app.
Contributing

Please contribute separately to the backend and frontend repositories via issues and pull requests.

License

MIT License

Contact

For more information, visit AIforGhana.

This README was generated to help manage the monorepo for AIforGhana's backend and frontend.
