# Passo 1: Comece com uma imagem base oficial do Python.
FROM python:3.11-slim

# Passo 2: Define o diretório de trabalho dentro do container.
WORKDIR /app

# Passo 3: Instala as dependências DIRETAMENTE no build.
# Com isso, eliminamos a necessidade do arquivo requirements.txt nesta etapa.
RUN pip install Flask gunicorn

# Passo 4: Copia todo o resto do nosso código para dentro do container.
COPY . .

# Passo 5: Expõe a porta 8000 para que o Gunicorn possa usá-la.
EXPOSE 8000

# Passo 6: Define o comando para executar quando o container iniciar.
CMD ["gunicorn", "--chdir", "/app", "app:app", "--bind", "0.0.0.0:8000"]