//------------------------ CLASSE PAIS ------------------------
public class Pais {
    public private(set) var nome: String
    public private(set) var economia: Int
    public private(set) var poderPolitico: Int
    public private(set) var tamanhoExercito: Int

    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int) {
        self.nome = nome
        self.economia = economia
        self.poderPolitico = poderPolitico
        self.tamanhoExercito = tamanhoExercito
    }

    public func ganhoPoderPolitico() {
        self.poderPolitico += 10
        print("Poder Politico: \(poderPolitico)") 
    }

    public func treinamentoMilitar() {
        self.tamanhoExercito += 500
        print("Tamanho do exercito: \(tamanhoExercito)") 
    }

//Regra Numero 1:
//Se o jogador deseja aumentar o tamanho do seu exercito mais rapidamente,
//ele usa um metodo que converte o poder politico em tropas para o exercito(1 pPolitico = 2 Soldados)
    public func treinamentoMilitar(pPolitico: Int) {
        if self.poderPolitico >= pPolitico {
            self.poderPolitico -= pPolitico
            self.tamanhoExercito += (pPolitico * 2)
            print("Tamanho do exercito: \(tamanhoExercito)")
        } 
        else {
            print("Nao possui Poder Politico Suficiente")
        }
    }

    public func alterarPoderPolitico(valor: Int) {
        self.poderPolitico += valor
    }

    public func alterarTamanhoExercito(valor: Int) {
        self.tamanhoExercito += valor
    }
}

//------------------------ CLASSE DEMOCRACIA ------------------------
public class Democracia: Pais {
    public private(set) var suportePopular: Bool
    
    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int, suportePopular: Bool) {
        self.suportePopular = suportePopular
        super.init(nome: nome, economia: economia, poderPolitico: poderPolitico, tamanhoExercito: tamanhoExercito)
    }

    override public func ganhoPoderPolitico() {
        if self.suportePopular {
            self.alterarPoderPolitico(valor: 15)
            print("+15 Poder Politico")
        } else {
            self.alterarPoderPolitico(valor: 5)
            print("+5 Poder Politico")
        }
    }
    
    public func exibirInformacoes() {
        print("Nome: \(nome)") 
        print("Economia: \(economia)") 
        print("Poder Politico: \(poderPolitico)") 
        print("Tamanho do Exercito: \(tamanhoExercito)")
        print("Suporte Popular: \(suportePopular ? "Possui" : "Nao Possui")")
    }

    public func alterarSuportePopular(novoStatus: Bool) {
        self.suportePopular = novoStatus
    }
}

//------------------------ CLASSE DITADURA ------------------------
public class Ditadura: Pais {
    public private(set) var militarizacao: Bool

    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int, militarizacao: Bool) {
        self.militarizacao = militarizacao
        super.init(nome: nome, economia: economia, poderPolitico: poderPolitico, tamanhoExercito: tamanhoExercito)
    }

    override public func treinamentoMilitar() {
        if self.militarizacao {
            self.alterarTamanhoExercito(valor: 1000)
            print("+1000 Soldados")
        } 
        else {
            self.alterarTamanhoExercito(valor: 750)
            print("+750 Soldados")
        }
    }

    public func exibirInformacoes() {
        print("Nome: \(nome)") 
        print("Economia: \(economia)") 
        print("Poder Politico: \(poderPolitico)") 
        print("Tamanho do Exercito: \(tamanhoExercito)")
        print("Militarizacao: \(militarizacao ? "Possui" : "Nao Possui")")
    }

    public func alterarMilitarizacao(novoStatus: Bool) {
        self.militarizacao = novoStatus
    }
}

//------------------------ CLASSE FACCOES (AGREGAÇÃO) ------------------------
public class Faccao {
    public private(set) var nomeFaccao: String
    public private(set) var lider: Pais
    public private(set) var membros: [Pais]

    public init(nomeFaccao: String, lider: Pais) {
        self.nomeFaccao = nomeFaccao
        self.lider = lider
        self.membros = [Pais]()
        self.membros.append(lider)
    }

    public func adicionarMembro(novoMembro: Pais) {
        self.membros.append(novoMembro)
        print("\(novoMembro.nome) juntou-se a facao \(nomeFaccao)")
    }

    public func exibirFaccao() {
        print("Nome: \(nomeFaccao)")
        print("Lider: \(lider.nome)") 
        print("Membros: ")
        for i in self.membros {
            print(" - \(i.nome)")
        }
    }
}

//------------------------ CLASSE AÇÃO DIPLOMÁTICA (ASSOCIAÇÃO) ------------------------
public class AcaoDiplomatica {
    public private(set) var tipo: String
    public private(set) var remetente: Pais
    public private(set) var destinatario: Pais
    public private(set) var aceito: Bool

    public init(tipo: String, remetente: Pais, destinatario: Pais, aceito: Bool) {
        self.tipo = tipo
        self.remetente = remetente
        self.destinatario = destinatario
        self.aceito = aceito
    }

    private func atualizarStatusAceito(para status: Bool) {
        self.aceito = status
    }

//Regra Numero 2:
//Ao chamar o metodo enviarProposta, o sistema valida se o remetente possui Poder Politico suficiente
//Se possuir, o custo e debitado e o sistema avalia o regime político do destinatario para ditar a aceitacao:
//  Ditadura: Aceita se o PP restante do remetente for maior ou igual a metade do PP da ditadura destinataria.
//  Democracia: Aceita automaticamente se a democracia destinataria possuir suporte popular ativo.
    public func enviarProposta() {
        let custoPP: Int = 15
        print("O pais \(remetente.nome) propos um \(tipo) para \(destinatario.nome)")

        if remetente.poderPolitico < custoPP {
            print("Acao cancelada: \(remetente.nome) nao possui Poder Politico suficiente para enviar a proposta (minimo: \(custoPP))")
            self.atualizarStatusAceito(para: false)
            return
        }

        remetente.alterarPoderPolitico(valor: -custoPP)
        print("\(remetente.nome) gastou \(custoPP) de Poder Politico")

        if destinatario is Ditadura {
            if remetente.poderPolitico >= destinatario.poderPolitico / 2 {
                print("\(destinatario.nome) aceitou o pacto de \(remetente.nome)")
                self.atualizarStatusAceito(para: true)
            } 
            else {
                print("\(destinatario.nome) recusou o pacto de \(remetente.nome)")
                self.atualizarStatusAceito(para: false)
            }
        } 
        else if let demo = destinatario as? Democracia {
            if demo.suportePopular {
                print("\(destinatario.nome) aceitou o pacto de \(remetente.nome)")
                self.atualizarStatusAceito(para: true)
            } 
            else {
                print("\(destinatario.nome) recusou o pacto de \(remetente.nome)")
                self.atualizarStatusAceito(para: false)
            }
        }
    }
}

//------------------------ CLASSE MAIN ------------------------
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
