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
