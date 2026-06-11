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