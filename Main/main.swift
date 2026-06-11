let franca = Ditadura(nome: "Franca", economia: 200, poderPolitico: 10, tamanhoExercito: 100000, militarizacao: true)
let alemanha = Democracia(nome: "Alemanha", economia: 180, poderPolitico: 5, tamanhoExercito: 90000, suportePopular: true)
let japao = Pais(nome: "Japao", economia: 95, poderPolitico: 40, tamanhoExercito: 250000)

print("Criando a faccao: Aliados")
let aliados = Faccao(nomeFaccao: "Aliados", lider: franca)
aliados.adicionarMembro(novoMembro: alemanha)
print("")

print("Paises gerando poder politico e treinando tropas")
alemanha.ganhoPoderPolitico() 
franca.treinamentoMilitar()   

print("Tentativa de treinamento rapido gastando Poder Politico:")
japao.treinamentoMilitar(pPolitico: 30)
print("")

print("Iniciando Acoes Diplomaticas")
let comercio = AcaoDiplomatica(tipo: "Tratado Comercial", remetente: alemanha, destinatario: franca, aceito: false)
comercio.enviarProposta() 