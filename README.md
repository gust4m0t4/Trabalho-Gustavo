# Calculadora Web Modularizada (Python, Flask, HTML e JavaScript)

Projeto desenvolvido para a disciplina de ProgramaÃ§Ã£o / Desenvolvimento Web, baseado no repositÃ³rio de exemplo do Professor Victor Thomaz.

---

## ðŸ‘¨â€ðŸ’» Autor
- **Aluno:** Gustavo Mota
- **Curso:** CiÃªncia da ComputaÃ§Ã£o (2Âº PerÃ­odo)

---

## ðŸ“– DescriÃ§Ã£o
AplicaÃ§Ã£o web interativa desenvolvida com **Flask (Python)** no backend e **HTML5 + JavaScript** no frontend. O sistema adota uma arquitetura modularizada em que cada operaÃ§Ã£o matemÃ¡tica possui sua prÃ³pria interface e rota dedicada, comunicando-se de forma assÃ­ncrona com o servidor via API (JSON).

### OperaÃ§Ãµes DisponÃ­veis:
- **Soma:** Realiza a adiÃ§Ã£o de dois nÃºmeros.
- **SubtraÃ§Ã£o:** Realiza a subtraÃ§Ã£o de dois nÃºmeros.
- **MultiplicaÃ§Ã£o:** Realiza a multiplicaÃ§Ã£o de dois nÃºmeros.
- **DivisÃ£o:** Realiza a divisÃ£o com tratamento de erro para divisÃ£o por zero.

---

## ðŸ› ï¸ Requisitos
- Python 3 instalado
- Ambiente virtual (`venv`)
- DependÃªncias listadas em `requirements.txt` (Flask)

---

## ðŸ“ Estrutura do Projeto

```
projeto_calculadora_js_nav/
â”‚
â”œâ”€â”€ app.py                   # InicializaÃ§Ã£o do Flask e definiÃ§Ã£o de rotas e APIs
â”œâ”€â”€ operacoes.py             # MÃ³dulo com a lÃ³gica das operaÃ§Ãµes matemÃ¡ticas
â”œâ”€â”€ requirements.txt         # DependÃªncias do projeto (Flask)
â”œâ”€â”€ README.md                # DocumentaÃ§Ã£o e identificaÃ§Ã£o do autor
â”œâ”€â”€ templates/               # Interfaces HTML (RenderizaÃ§Ã£o via Jinja2)
â”‚   â”œâ”€â”€ index.html           # PÃ¡gina inicial com menu de navegaÃ§Ã£o
â”‚   â”œâ”€â”€ soma.html            # Interface para cÃ¡lculo de soma
â”‚   â”œâ”€â”€ subtracao.html       # Interface para cÃ¡lculo de subtraÃ§Ã£o
â”‚   â”œâ”€â”€ multiplicacao.html   # Interface para cÃ¡lculo de multiplicaÃ§Ã£o
â”‚   â””â”€â”€ divisao.html         # Interface para cÃ¡lculo de divisÃ£o
â””â”€â”€ static/                  # Arquivos estÃ¡ticos
    â””â”€â”€ script.js            # RequisiÃ§Ãµes assÃ­ncronas (fetch) para a API Flask
```

---

## ðŸš€ Como Executar o Projeto Localmente

### 1. Clonar o repositÃ³rio
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

### 3. Instalar as dependÃªncias
```powershell
pip install -r requirements.txt
```

### 4. Iniciar a aplicaÃ§Ã£o
```powershell
python app.py
```

### 5. Acessar no navegador
Abra o navegador e acesse:
[http://127.0.0.1:5000](http://127.0.0.1:5000)

Pressione `Ctrl + C` no terminal para encerrar o servidor.

