FROM python:3.10-slim

WORKDIR /app
COPY . .

# Augmente le timeout à 300 secondes et réessaye 5 fois
RUN pip install --default-timeout=300 --retries=5 --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["python", "run.py"]
