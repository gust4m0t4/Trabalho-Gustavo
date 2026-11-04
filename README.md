# Calculadora Web Modularizada (Python, Flask, HTML e JavaScript)

![Python Flask CI](https://github.com/gust4m0t4/Trabalho-Gustavo/actions/workflows/ci.yml/badge.svg)

Projeto desenvolvido para a disciplina de Programação / Desenvolvimento Web, baseado no repositório de exemplo do Professor Victor Thomaz.

---

## 👨‍💻 Autor
- **Aluno:** Gustavo Mota
- **Curso:** Ciência da Computação (2º Período)

---

## 📖 Descrição
Aplicação web interativa desenvolvida com **Flask (Python)** no backend e **HTML5 + JavaScript** no frontend. O sistema adota uma arquitetura modularizada em que cada operação matemática possui sua própria interface e rota dedicada, comunicando-se de forma assíncrona com o servidor via API (JSON).

O projeto conta com integração contínua (**CI**) via **GitHub Actions**, executando testes automatizados a cada push ou pull request nas branches `main` e `gustavo_mota`.

### Operações Disponíveis:
- **Soma:** Realiza a adição de dois números.
- **Subtração:** Realiza a subtração de dois números.
- **Multiplicação:** Realiza a multiplicação de dois números.
- **Divisão:** Realiza a divisão com tratamento de erro para divisão por zero.

---

## 🛠️ Requisitos
- Python 3 instalado
- Ambiente virtual (`venv`)
- Dependências listadas em `requirements.txt` (Flask, PyTest)

---

## 📁 Estrutura do Projeto

```
Trabalho-Gustavo/
│
├── .github/workflows/
│   └── ci.yml               # Pipeline de CI/CD do GitHub Actions
├── app.py                   # Inicialização do Flask e definição de rotas e APIs
├── operacoes.py             # Módulo com a lógica das operações matemáticas
├── test_operacoes.py        # Testes unitários automatizados com PyTest
├── requirements.txt         # Dependências do projeto (Flask, PyTest)
├── .gitignore               # Arquivos e pastas ignorados pelo Git
├── README.md                # Documentação e identificação do autor
├── templates/               # Interfaces HTML (Renderização via Jinja2)
│   ├── index.html           # Página inicial com menu de navegação
│   ├── soma.html            # Interface para cálculo de soma
│   ├── subtracao.html       # Interface para cálculo de subtração
│   ├── multiplicacao.html   # Interface para cálculo de multiplicação
│   └── divisao.html         # Interface para cálculo de divisão
└── static/                  # Arquivos estáticos
    └── script.js            # Requisições assíncronas (fetch) para a API Flask
```

---

## 🧪 Executando os Testes Unitários
Para rodar a bateria de testes automatizados localmente:
```powershell
pytest test_operacoes.py -v
```

---

## 🚀 Como Executar o Projeto Localmente

### 1. Clonar o repositório
```bash
git clone https://github.com/gust4m0t4/Trabalho-Gustavo.git
cd Trabalho-Gustavo
```

### 2. Criar e ativar o ambiente virtual (Windows)
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```
*(Se estiver usando Prompt de Comando cmd: `.venv\Scripts\activate.bat`)*

### 3. Instalar as dependências
```powershell
pip install -r requirements.txt
```

### 4. Iniciar a aplicação
```powershell
python app.py
```

### 5. Acessar no navegador
Abra o navegador e acesse:
[http://127.0.0.1:5000](http://127.0.0.1:5000)

Pressione `Ctrl + C` no terminal para encerrar o servidor.
