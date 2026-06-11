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

//Regra Numero 2:
//Ao chamar o metodo enviarProposta, o sistema valida se o remetente possui Poder Politico suficiente
//Se possuir, o custo e debitado e o sistema avalia o regime político do destinatario para ditar a aceitacao:
//  Ditadura: Aceita se o PP restante do remetente for maior ou igual a metade do PP da ditadura destinataria.
//  Democracia: Aceita automaticamente se a democracia destinataria possuir suporte popular ativo.
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