# Passo 1: Comece com uma imagem base oficial do Python.
FROM python:3.11-slim

# Passo 2: Define o diretório de trabalho dentro do container.
WORKDIR /app

# Passo 3: Copia o arquivo de dependências para dentro do container.
COPY requirements.txt .

# Passo 4: Instala as dependências listadas no requirements.txt.
# O --no-cache-dir é uma boa prática para manter a imagem pequena.
RUN pip install --no-cache-dir -r requirements.txt

# Passo 5: Copia todo o resto do nosso código para dentro do container.
COPY . .

# Passo 6: Expõe a porta 8000 para que o Gunicorn possa usá-la.
EXPOSE 8000

# Passo 7: Define o comando para executar quando o container iniciar.
# Usaremos o comando do nosso Procfile, mas é bom ter aqui também.
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]