#!/bin/bash
set -e

cd /app/data

# Create project if not exists
if [ ! -d "pythondemo" ]; then
    uv venv pythondemo
fi

cd pythondemo

# Copy pyproject.toml if missing
if [ ! -f pyproject.toml ]; then
    cp /app/pyproject.toml .
fi

# Install dependencies
uv pip install -r <(uv pip compile pyproject.toml)

# Start FastAPI app (adjust path if needed)
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
