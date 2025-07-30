FROM python:3.12

# Install uv
RUN pip install --upgrade pip && pip install uv

# Create workdir
WORKDIR /app

# Copy init script & pyproject.toml
COPY init.sh /app/init.sh
COPY pyproject.toml /app/pyproject.toml

RUN chmod +x /app/init.sh

# Default command
CMD ["bash", "/app/init.sh"]
