FROM python:3.11-slim

WORKDIR /app

# Install system packages for pymupdf + other dependencies
RUN apt-get update && apt-get install -y \
    gcc g++ make \
    libmupdf-dev \
    libgl1 \
    libclang-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app.py .


EXPOSE 5050
CMD ["flask", "run", "--host=0.0.0.0", "--port=5050"]
