from flask import Flask, request, jsonify, render_template
import operacoes

app = Flask(__name__)

# PÃ¡gina inicial
@app.route("/")
def index():
    return render_template("index.html")

# PÃ¡gina de soma
@app.route("/soma")
def soma_page():
    return render_template("soma.html")

@app.route("/api/soma", methods=["POST"])
def soma():
    dados = request.get_json()
    valor1 = float(dados["valor1"])
    valor2 = float(dados["valor2"])
    resultado = operacoes.calcular_soma(valor1, valor2)
    return jsonify({"resultado": resultado})

# PÃ¡gina de subtraÃ§Ã£o
@app.route("/subtracao")
def subtracao_page():
    return render_template("subtracao.html")

@app.route("/api/subtracao", methods=["POST"])
def subtracao():
    dados = request.get_json()
    valor1 = float(dados["valor1"])
    valor2 = float(dados["valor2"])
    resultado = operacoes.calcular_subtracao(valor1, valor2)
    return jsonify({"resultado": resultado})

if __name__ == "__main__":
    app.run(debug=True)
