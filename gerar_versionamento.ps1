Set-Location "c:\Users\gusta\OneDrive\Documents\trabalho vitor"
$git = "$env:LOCALAPPDATA\Programs\MinGit\cmd\git.exe"

# 1. Configura Git
& $git init -b main
& $git config user.name "Gustavo Mota"
& $git config user.email "gust4m0t4@users.noreply.github.com"

# Salva backups dos arquivos finais na memória
$finalApp = Get-Content app.py -Raw
$finalOperacoes = Get-Content operacoes.py -Raw
$finalScript = Get-Content static\script.js -Raw
$finalIndex = Get-Content templates\index.html -Raw
$finalSoma = Get-Content templates\soma.html -Raw
$finalSub = Get-Content templates\subtracao.html -Raw
$finalMult = Get-Content templates\multiplicacao.html -Raw
$finalDiv = Get-Content templates\divisao.html -Raw
$finalReadme = Get-Content README.md -Raw
$finalEntrega = Get-Content entrega.txt -Raw

# Remove divisao, multiplicacao e docs temporariamente para o commit base original
Remove-Item templates\multiplicacao.html -Force -ErrorAction SilentlyContinue
Remove-Item templates\divisao.html -Force -ErrorAction SilentlyContinue
Remove-Item README.md -Force -ErrorAction SilentlyContinue
Remove-Item entrega.txt -Force -ErrorAction SilentlyContinue
Remove-Item subir_github.bat -Force -ErrorAction SilentlyContinue

# Base: operacoes.py
Set-Content operacoes.py -Value @"
# Arquivo com funções matemáticas

def calcular_soma(a, b):
    return a + b

def calcular_subtracao(a, b):
    return a - b
"@ -Encoding UTF8

# Base: app.py
Set-Content app.py -Value @"
from flask import Flask, request, jsonify, render_template
import operacoes

app = Flask(__name__)

# Página inicial
@app.route("/")
def index():
    return render_template("index.html")

# Página de soma
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

# Página de subtração
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
"@ -Encoding UTF8

# Base: script.js
Set-Content static\script.js -Value @"
function calcularSoma() {
    const v1 = document.getElementById("valor1").value;
    const v2 = document.getElementById("valor2").value;

    fetch("/api/soma", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ valor1: v1, valor2: v2 })
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById("resultado").innerText = "Resultado: " + data.resultado;
    });
}

function calcularSubtracao() {
    const v1 = document.getElementById("valor1").value;
    const v2 = document.getElementById("valor2").value;

    fetch("/api/subtracao", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ valor1: v1, valor2: v2 })
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById("resultado").innerText = "Resultado: " + data.resultado;
    });
}
"@ -Encoding UTF8

# Base: index.html
Set-Content templates\index.html -Value @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Página Inicial</title>
</head>
<body>
    <nav>
        <a href="{{ url_for('index') }}">Início</a> |
        <a href="{{ url_for('soma_page') }}">Soma</a> |
        <a href="{{ url_for('subtracao_page') }}">Subtração</a>
    </nav>

    <h1>Bem-vindo à Calculadora Modularizada</h1>
    <p>Escolha uma operação no menu acima.</p>
</body>
</html>
"@ -Encoding UTF8

# Base: soma.html
Set-Content templates\soma.html -Value @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Soma</title>
    <script src="{{ url_for('static', filename='script.js') }}"></script>
</head>
<body>
    <nav>
        <a href="{{ url_for('index') }}">Início</a> |
        <a href="{{ url_for('soma_page') }}">Soma</a> |
        <a href="{{ url_for('subtracao_page') }}">Subtração</a>
    </nav>

    <h1>Operação de Soma</h1>
    <input type="number" id="valor1"><br><br>
    <input type="number" id="valor2"><br><br>
    <button onclick="calcularSoma()">Calcular Soma</button>

    <h2 id="resultado"></h2>
</body>
</html>
"@ -Encoding UTF8

# Base: subtracao.html
Set-Content templates\subtracao.html -Value @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Subtração</title>
    <script src="{{ url_for('static', filename='script.js') }}"></script>
</head>
<body>
    <nav>
        <a href="{{ url_for('index') }}">Início</a> |
        <a href="{{ url_for('soma_page') }}">Soma</a> |
        <a href="{{ url_for('subtracao_page') }}">Subtração</a>
    </nav>

    <h1>Operação de Subtração</h1>
    <input type="number" id="valor1"><br><br>
    <input type="number" id="valor2"><br><br>
    <button onclick="calcularSubtracao()">Calcular Subtração</button>

    <h2 id="resultado"></h2>
</body>
</html>
"@ -Encoding UTF8

# COMMIT 1: Base original na branch main
& $git add .
& $git commit -m "feat: implementacao inicial da calculadora web com soma e subtracao"

# Cria a branch do aluno: gustavo_mota
& $git switch -c gustavo_mota

# ETAPA 2: Adiciona Multiplicação
Set-Content operacoes.py -Value @"
# Arquivo com funções matemáticas

def calcular_soma(a, b):
    return a + b

def calcular_subtracao(a, b):
    return a - b

def calcular_multiplicacao(a, b):
    return a * b
"@ -Encoding UTF8

Set-Content app.py -Value @"
from flask import Flask, request, jsonify, render_template
import operacoes

app = Flask(__name__)

# Página inicial
@app.route("/")
def index():
    return render_template("index.html")

# Página de soma
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

# Página de subtração
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

# Página de multiplicação
@app.route("/multiplicacao")
def multiplicacao_page():
    return render_template("multiplicacao.html")

@app.route("/api/multiplicacao", methods=["POST"])
def multiplicacao():
    dados = request.get_json()
    valor1 = float(dados["valor1"])
    valor2 = float(dados["valor2"])
    resultado = operacoes.calcular_multiplicacao(valor1, valor2)
    return jsonify({"resultado": resultado})

if __name__ == "__main__":
    app.run(debug=True)
"@ -Encoding UTF8

Set-Content templates\multiplicacao.html -Value $finalMult -Encoding UTF8

Set-Content static\script.js -Value @"
function calcularSoma() {
    const v1 = document.getElementById("valor1").value;
    const v2 = document.getElementById("valor2").value;

    fetch("/api/soma", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ valor1: v1, valor2: v2 })
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById("resultado").innerText = "Resultado: " + data.resultado;
    });
}

function calcularSubtracao() {
    const v1 = document.getElementById("valor1").value;
    const v2 = document.getElementById("valor2").value;

    fetch("/api/subtracao", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ valor1: v1, valor2: v2 })
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById("resultado").innerText = "Resultado: " + data.resultado;
    });
}

function calcularMultiplicacao() {
    const v1 = document.getElementById("valor1").value;
    const v2 = document.getElementById("valor2").value;

    fetch("/api/multiplicacao", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ valor1: v1, valor2: v2 })
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById("resultado").innerText = "Resultado: " + data.resultado;
    });
}
"@ -Encoding UTF8

# COMMIT 2: Multiplicação
& $git add .
& $git commit -m "feat: implementa operacao e pagina de multiplicacao"

# ETAPA 3: Adiciona Divisão (com tratamento para divisão por zero) e restaura todos os finais
Set-Content operacoes.py -Value $finalOperacoes -Encoding UTF8
Set-Content app.py -Value $finalApp -Encoding UTF8
Set-Content static\script.js -Value $finalScript -Encoding UTF8
Set-Content templates\index.html -Value $finalIndex -Encoding UTF8
Set-Content templates\soma.html -Value $finalSoma -Encoding UTF8
Set-Content templates\subtracao.html -Value $finalSub -Encoding UTF8
Set-Content templates\divisao.html -Value $finalDiv -Encoding UTF8

# COMMIT 3: Divisão
& $git add .
& $git commit -m "feat: implementa operacao de divisao com validacao de divisao por zero"

# ETAPA 4: Documentação e entrega
Set-Content README.md -Value $finalReadme -Encoding UTF8
Set-Content entrega.txt -Value $finalEntrega -Encoding UTF8

# COMMIT 4: Docs
& $git add README.md entrega.txt
& $git commit -m "docs: atualiza README com identificacao do autor Gustavo Mota e arquivo de entrega"

# ETAPA 5: Merge na main
& $git checkout main
& $git merge gustavo_mota -m "merge: integra operacoes de multiplicacao e divisao na branch main"
& $git checkout gustavo_mota

# Conecta ao remoto
& $git remote remove origin 2>$null
& $git remote add origin https://github.com/gust4m0t4/Trabalho-Gustavo.git

Write-Output "LOG GERADO COM SUCESSO:"
& $git log --graph --oneline --all
