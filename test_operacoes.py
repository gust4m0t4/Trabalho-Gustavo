import operacoes

def test_soma():
    assert operacoes.calcular_soma(10, 5) == 15
    assert operacoes.calcular_soma(-2, 5) == 3

def test_subtracao():
    assert operacoes.calcular_subtracao(10, 5) == 5
    assert operacoes.calcular_subtracao(5, 10) == -5

def test_multiplicacao():
    assert operacoes.calcular_multiplicacao(10, 5) == 50
    assert operacoes.calcular_multiplicacao(-2, 4) == -8

def test_divisao():
    assert operacoes.calcular_divisao(10, 2) == 5.0
    assert operacoes.calcular_divisao(9, 2) == 4.5

def test_divisao_por_zero():
    resultado = operacoes.calcular_divisao(10, 0)
    assert "Erro" in resultado

if __name__ == "__main__":
    test_soma()
    test_subtracao()
    test_multiplicacao()
    test_divisao()
    test_divisao_por_zero()
    print("Todos os testes passaram com sucesso!")
