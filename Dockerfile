FROM ubuntu:latest

# Install Python, pip, curl, git
RUN apt-get update && \
    apt-get install -y python3 python3-pip curl git && \
    pip3 install --upgrade pip

# Install uv package manager
RUN pip install uv

# Set workdir
WORKDIR /app

# Copy init script & pyproject.toml into image
COPY init.sh /app/init.sh
COPY pyproject.toml /app/pyproject.toml
RUN chmod +x /app/init.sh

# Default command
CMD ["bash", "init.sh"]
