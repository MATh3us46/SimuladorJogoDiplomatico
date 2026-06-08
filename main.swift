//------------------------ CLASSE PAIS ------------------------
public class Pais {
    //Variaveis 
    private var _nome: String
    private var _economia: Int
    private var _poderPolitico: Int
    private var _tamanhoExercito: Int

    //Construtor 
    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int){
        self._nome = nome
        self._economia = economia
        self._poderPolitico = poderPolitico
        self._tamanhoExercito = tamanhoExercito
    }

    //Metodos
    public func ganhoPoderPolitico(){
        self._poderPolitico += 10
        print("Poder Politico: \(poderPolitico)") 
    }

    public func treinamentoMilitar(){
        self._tamanhoExercito += 500
        print("Tamanho do exercito: \(tamanhoExercito)") 
    }

    //Regra de Negocio 1°
    public func treinamentoMilitar(pPolitico: Int){
        if self._poderPolitico >= pPolitico{
            self._poderPolitico -= pPolitico;
            self._tamanhoExercito += (pPolitico * 2)
            print("Tamanho do exercito: \(tamanhoExercito)")
        }
        else{
            print("Nao possui Poder Politico Suficiente")
        }
    }

    //Getters e Setters
    public var nome: String{
        get {
            return _nome
        }
        set {
            _nome = newValue 
        }
    }

    public var economia: Int{
        get {
            return _economia
        }
        set {
            _economia = newValue 
        }
    }

    public var poderPolitico: Int{
        get {
            return _poderPolitico
        }
        set {
            _poderPolitico = newValue 
        }
    }

    public var tamanhoExercito: Int{
        get {
            return _tamanhoExercito
        }
        set {
            _tamanhoExercito = newValue 
        }
    }
}

//------------------------ CLASSE DEMOCRACIA ------------------------
public class Democracia: Pais{
    private var _suportePopular: Bool
    //Construtor 
    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int, suportePopular: Bool){
        self._suportePopular = suportePopular
        super.init(nome: nome, economia: economia, poderPolitico: poderPolitico, tamanhoExercito: tamanhoExercito)
    }

    //Metodos
    override public func ganhoPoderPolitico(){
        if self._suportePopular{
            self.poderPolitico += 15
            print("+15 Poder Politico")
        } 
        else{
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

    //Getters e Setters
    public var suportePopular: Bool{
        get {
            return _suportePopular
        }
        set {
            _suportePopular = newValue 
        }
    }
}

//------------------------ CLASSE DITADURA ------------------------
public class Ditadura: Pais{
    //Variaveis 
    private var _militarizacao: Bool

    //Construtor 
    public init(nome: String, economia: Int, poderPolitico: Int, tamanhoExercito: Int, militarizacao: Bool){
        self._militarizacao = militarizacao
        super.init(nome: nome, economia: economia, poderPolitico: poderPolitico, tamanhoExercito: tamanhoExercito)
    }

    //Metodos
    override public func treinamentoMilitar(){
        if self._militarizacao{
            self.tamanhoExercito += 1000
            print("+1000 Soldados")
        } 
        else{
            self.tamanhoExercito += 750
            print("+750 Soldados")
        }
    }

    //Getters e Setters
    public var militarizacao: Bool{
        get {
            return _militarizacao
        }
        set {
            _militarizacao = newValue 
        }
    }
}

//------------------------ CLASSE MAIN ------------------------
let Franca = Ditadura(nome: "Franca", economia: 200, poderPolitico: 70, tamanhoExercito: 100000, militarizacao: true)

Franca.treinamentoMilitar(pPolitico: 15)
Franca.treinamentoMilitar();

