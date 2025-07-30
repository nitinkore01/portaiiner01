#!/bin/bash
set -e

cd /app/data

# Create uv project if not exists
if [ ! -d "pythondemo" ]; then
    echo "Creating uv project 'pythondemo'..."
    uv venv pythondemo
fi

cd pythondemo

# Copy pyproject.toml if missing
if [ ! -f "pyproject.toml" ]; then
    echo "Copying pyproject.toml..."
    cp /app/pyproject.toml .
fi

# Install deps
uv pip install -r <(uv pip compile pyproject.toml)

# Start FastAPI app (replace 'main:app' with actual if needed)
echo "Starting FastAPI app..."
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
