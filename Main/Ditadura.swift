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