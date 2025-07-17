from flask import Flask
import os

# Cria a aplicação Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    """Esta função roda quando alguém acessa a página inicial."""
    return '<h1>Olá, Mundo! A aplicação está no ar.</h1>'

if __name__ == "__main__":
    # Pega a porta do ambiente ou usa 5000 como padrão.
    port = int(os.environ.get('PORT', 5000))
    # Roda a aplicação.
    app.run(host='0.0.0.0', port=port)