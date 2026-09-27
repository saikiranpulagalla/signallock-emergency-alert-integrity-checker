FROM python:3.13-slim
WORKDIR /app
COPY pyproject.toml ./
COPY signallock ./signallock
COPY apps ./apps
COPY web ./web
RUN pip install --no-cache-dir .
ENV PYTHONUNBUFFERED=1
EXPOSE 8000
CMD ["sh", "-c", "python -m uvicorn apps.api.main:app --host 0.0.0.0 --port ${PORT:-8000}"]
