FROM python:3.10-slim
WORKDIR /app

# Install awscli (remove if unused) and clean apt cache
RUN apt-get update \
	&& apt-get install -y --no-install-recommends awscli \
	&& rm -rf /var/lib/apt/lists/*

# Install Python dependencies first to leverage build cache
ENV PIP_DEFAULT_TIMEOUT=120
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade pip \
	&& pip install --no-cache-dir -r requirements.txt

# Copy application source
COPY . /app

# Expose FastAPI port
EXPOSE 8000

# Start the app (uvicorn invoked inside app.py)
CMD ["python3", "app.py"]