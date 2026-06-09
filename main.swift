//------------------------ CLASSE PAIS ------------------------
public class Pais{
    public var nome: String
    public var economia: Int
    public var poderPolitico: Int
    public var tamanhoExercito: Int

    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int){
        self.nome = nome
        self.economia = economia
        self.poderPolitico = poderPolitico
        self.tamanhoExercito = tamanhoExercito
    }

    public func ganhoPoderPolitico(){
        self.poderPolitico += 10
        print("Poder Politico: \(poderPolitico)") 
    }

    public func treinamentoMilitar(){
        self.tamanhoExercito += 500
        print("Tamanho do exercito: \(tamanhoExercito)") 
    }

    public func treinamentoMilitar(pPolitico: Int){
        if self.poderPolitico >= pPolitico{
            self.poderPolitico -= pPolitico
            self.tamanhoExercito += (pPolitico * 2)
            print("Tamanho do exercito: \(tamanhoExercito)")
        } 
        else{
            print("Nao possui Poder Politico Suficiente")
        }
    }
}

//------------------------ CLASSE DEMOCRACIA ------------------------
public class Democracia: Pais{
    public var suportePopular: Bool
    
    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int, suportePopular: Bool){
        self.suportePopular = suportePopular
        super.init(nome: nome, economia: economia, poderPolitico: poderPolitico, tamanhoExercito: tamanhoExercito)
    }

    override public func ganhoPoderPolitico(){
        if self.suportePopular {
            self.poderPolitico += 15
            print("+15 Poder Politico")
        } else {
            self.poderPolitico += 5
            print("+5 Poder Politico")
        }
    }
    
    public func exibirInformacoes(){
        print("Nome: \(nome)") 
        print("Economia: \(economia)") 
        print("Poder Politico: \(poderPolitico)") 
        print("Tamanho do Exercito: \(tamanhoExercito)")
        print("Suporte Popular: \(suportePopular ? "Possui" : "Nao Possui")")
    }
}

//------------------------ CLASSE DITADURA ------------------------
public class Ditadura: Pais{
    public var militarizacao: Bool

    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int, militarizacao: Bool){
        self.militarizacao = militarizacao
        super.init(nome: nome, economia: economia, poderPolitico: poderPolitico, tamanhoExercito: tamanhoExercito)
    }

    override public func treinamentoMilitar(){
        if self.militarizacao{
            self.tamanhoExercito += 1000
            print("+1000 Soldados")
        } 
        else{
            self.tamanhoExercito += 750
            print("+750 Soldados")
        }
    }

    public func exibirInformacoes(){
        print("Nome: \(nome)") 
        print("Economia: \(economia)") 
        print("Poder Politico: \(poderPolitico)") 
        print("Tamanho do Exercito: \(tamanhoExercito)")
        print("Militarizacao: \(militarizacao ? "Possui" : "Nao Possui")")
    }
}

//------------------------ CLASSE FACCOES (AGREGAÇÃO) ------------------------
public class Faccao {
    public var nomeFaccao: String
    public var lider: Pais
    public var membros: [Pais]

    public init(nomeFaccao: String, lider: Pais){
        self.nomeFaccao = nomeFaccao
        self.lider = lider
        self.membros = [Pais]()
        self.membros.append(lider)
    }

    public func adicionarMembro(novoMembro: Pais){
        self.membros.append(novoMembro)
        print("\(novoMembro.nome) juntou-se a facao \(nomeFaccao)")
    }

    public func exibirFaccao(){
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
    public var tipo: String
    public var remetente: Pais
    public var destinatario: Pais
    public var aceito: Bool

    public init(tipo: String, remetente: Pais, destinatario: Pais, aceito: Bool){
        self.tipo = tipo
        self.remetente = remetente
        self.destinatario = destinatario
        self.aceito = aceito
    }

    public func enviarProposta(){
        let custoPP: Int = 15
        print("O pais \(remetente.nome) propos um \(tipo) para \(destinatario.nome)")

        if remetente.poderPolitico < custoPP{
            print("Acao cancelada: \(remetente.nome) nao possui Poder Politico suficiente para enviar a proposta (minimo: \(custoPP))")
            self.aceito = false
            return
        }

        remetente.poderPolitico = remetente.poderPolitico - custoPP
        print("\(remetente.nome) gastou \(custoPP) de Poder Politico")

        if destinatario is Ditadura{
            if remetente.poderPolitico >= destinatario.poderPolitico / 2{
                print("\(destinatario.nome) aceitou o pacto de \(remetente.nome)")
                self.aceito = true
            } 
            else{
                print("\(destinatario.nome) recusou o pacto de \(remetente.nome)")
                self.aceito = false
            }
        } 
        else if let demo = destinatario as? Democracia {
            if demo.suportePopular {
                print("\(destinatario.nome) aceitou o pacto de \(remetente.nome)")
                self.aceito = true
            } 
            else {
                print("\(destinatario.nome) recusou o pacto de \(remetente.nome)")
                self.aceito = false
            }
        }
    }
}

//------------------------ CLASSE MAIN ------------------------
