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
