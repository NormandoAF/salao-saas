# Passo 1: Comece com uma imagem base oficial do Python.
FROM python:3.11-slim

# Passo 2: Define o diretório de trabalho dentro do container.
WORKDIR /app

# Passo 3: Instala as dependências a partir do requirements.txt.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Passo 4: Copia todo o resto do nosso código para dentro do container.
COPY . .

# Passo 5: Expõe a porta 8000.
EXPOSE 8000

# Passo 6: Define o comando para executar a aplicação DJANGO.
CMD ["gunicorn", "--worker-class", "gthread", "--threads", "4", "--chdir", "/app", "core.wsgi:application", "--bind", "0.0.0.0:8000"]