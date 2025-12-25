FROM python:3.10-slim-bullseye  # Меньше базовый образ
RUN apt-get update && apt-get install -y gcc && rm -rf /var/lib/apt/lists/*  # Кэш чистить
RUN pip install --no-cache-dir --user mlflow==3.8.0  # Без кэша, в user-space
RUN apt-get purge -y gcc  # Удалить компиляторы
COPY . .
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
