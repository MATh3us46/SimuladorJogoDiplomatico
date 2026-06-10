# Simulador de Jogo Diplomático

### Software Definido:
O projeto visa implementar um simulador de jogo diplomático, possuindo países que variam entre Democracias e Ditaduras. Com o sistema, elas podem criar suas próprias facções ou realizar acordos com outros países.

### Problema a ser resolvido:
Como simular a lógica e as regras de um jogo de estratégia geopolítica, controlando os recursos e as decisões de cada país com base no seu tipo de governo.

### Principais funcionalidades:
* Diferenciação entre países (Democracias e Ditaduras).
* Sistema diplomático e acordos entre nações.
* Criação e gerenciamento de facções com líderes e membros.
* Treinamento militar com gasto de poder político.

## Diagrama De Classes

<div align="center">
  <img src="https://github.com/user-attachments/assets/15a458a6-04f8-4486-8b73-67bc999de056" alt="Diagrama de Classes UML" width="100%" />
</div>

## Descrição sobre a linguagem escolhida:

### Sobre a Linguagem Swift

A **Swift** é uma linguagem de programação moderna, Open Source, criada pela Apple em 2014. Desenvolvida inicialmente para o ecossistema iOS e macOS, hoje ela também possui suporte oficial para Linux e Windows.

### Principais Destaques:

* **Rápida:** Desenvolvida com foco em desempenho, utiliza tecnologia de compilador avançada para entregar uma velocidade de execução comparável à da linguagem C++.
* **Expressiva:** Possui uma sintaxe limpa, moderna e intuitiva. Reduzindo os códigos repetitivos, tornando o código fácil de ler e escrever.
* **Segura:** Projetada para eliminar categorias inteiras de erros comuns de programação. Ela garante que variáveis sejam inicializadas antes do uso e gerencia a memória automaticamente.
* **Interoperável:** Consegue conviver e se integrar com códigos C e C++, sem perda de performance.
* **Adaptável:** É uma linguagem multiparadigma que se ajusta a qualquer tipo de projeto — desde aplicativos mobile e sistemas desktop até desenvolvimento de servidores.

## Implementações com exemplos de código.
### Classe País:
```swift
let japao = Pais(nome: "Japao", economia: 95, poderPolitico: 10, tamanhoExercito: 250000)

//Incrementa o poder politico do pais em +10 e exibe uma mensagem
japao.ganhoPoderPolitico()

//Incrementa o exercito em +500 soldados e exibe uma mensagem
japao.treinamentoMilitar()

//Caso queira mais soldados rapidamente, o jogador pode gastar poder político (cada 1 pPolitico gera 2 soldados)
//Se possuir poder politico suficiente, incrementa o exercito e exibe uma mensagem
//Se nao possuir poder politico suficiente, exibe uma mensagem de erro
japao.treinamentoMilitar(pPolitico: 50)
```
**Demonstração:**  
Poder Politico: 20  
Tamanho do exercito: 250500  
Nao possui Poder Politico Suficiente  
### Classe Democracia:
```swift
let alemanha = Democracia(nome: "Alemanha", economia: 200, poderPolitico: 50, tamanhoExercito: 100000, suportePopular: true)

//Executa o método herdado da classe Pais
alemanha.treinamentoMilitar(pPolitico: 25)

//Exibe as informacoes do pais democracia
alemanha.exibirInformacoes()

//Sobrescreve o metodo pai incrementando o poder politico baseado no suportePopular
//Se possui suporte popular incrementa o poder politico do pais em +15 e exibe uma mensagem
//Se não possui suporte popular incrementa o poder politico do pais em +5 e exibe uma mensagem
alemanha.ganhoPoderPolitico()

//Exibe as informacoes do pais democracia
alemanha.exibirInformacoes()
```
**Demonstração:**    
Tamanho do exercito: 100050  
Nome: Alemanha  
Economia: 200  
Poder Politico: 25  
Tamanho do Exercito: 100050  
Suporte Popular: Possui  
+15 Poder Politico  
Nome: Alemanha  
Economia: 200  
Poder Politico: 40  
Tamanho do Exercito: 100050  
Suporte Popular: Possui  
### Classe Ditadura:
```swift
let franca = Ditadura(nome: "Franca", economia: 200, poderPolitico: 70, tamanhoExercito: 100000, militarizacao: true)

//Executa o método herdado da classe Pais
franca.treinamentoMilitar(pPolitico: 15)

//Exibe as informações do país ditadura
franca.exibirInformacoes()

//Sobrescreve o método pai, incrementando o tamanho do exército baseado na militarização
//Se possui militarização, incrementa o tamanho do exército do país em +1000 e exibe uma mensagem
//Se não possui militarização, incrementa o tamanho do exército do país em +750 e exibe uma mensagem
franca.treinamentoMilitar()

//Exibe as informações do país ditadura
franca.exibirInformacoes()
```
**Demonstração:**    
Tamanho do exercito: 100030  
Nome: Franca  
Economia: 200  
Poder Politico: 55  
Tamanho do Exercito: 100030  
Militarizacao: Possui  
+1000 Soldados  
Nome: Franca  
Economia: 200  
Poder Politico: 55  
Tamanho do Exercito: 101030  
Militarizacao: Possui  
### Classe Facção:
```swift
let franca = Ditadura(nome: "Franca", economia: 200, poderPolitico: 70, tamanhoExercito: 100000, militarizacao: true)
let aliados = Faccao(nomeFaccao: "Aliados", lider: franca)
let alemanha = Democracia(nome: "Alemanha", economia: 200, poderPolitico: 50, tamanhoExercito: 100000, suportePopular: true)

//Quando a facção é criada, ela já possui um líder que também é incluído como membro automático
//Exibe os dados da facção 
aliados.exibirFaccao()

//Adiciona um novo membro à facção e exibe uma mensagem de confirmação
aliados.adicionarMembro(novoMembro: alemanha)

//Exibe os dados da facção 
aliados.exibirFaccao()
```
**Demonstração:**  
Nome: Aliados  
Lider: Franca  
Membros:   
-Franca  
Alemanha juntou-se a facao Aliados  
Nome: Aliados  
Lider: Franca  
Membros:   
-Franca  
-Alemanha  
### Classe Ação Diplomatica:
```swift
let franca = Ditadura(nome: "Franca", economia: 200, poderPolitico: 1000, tamanhoExercito: 100000, militarizacao: true)
let alemanha = Democracia(nome: "Alemanha", economia: 200, poderPolitico: 10, tamanhoExercito: 100000, suportePopular: true)

let comercio = AcaoDiplomatica(tipo: "comercio", remetente: alemanha, destinatario: franca, aceito: true)

//Chama o metodo enviar proposta
//Se nao possuir poder politico o suficiente, mostra uma mensagem de erro
//Se possui poder politico, desconta o custo e avalia o regime do destinatario:
//  Ditadura: Se o remetente possuir mais poder politico que a metade do poder politico do destinatario, o acordo e aceito; se nao, e recusado
//  Democracia: Se possuir suporte popular, aceita o acordo; se nao, recusa

comercio.enviarProposta()
alemanha.ganhoPoderPolitico()
comercio.enviarProposta()
```
**Demonstração:**  
O pais Alemanha propos um comercio para Franca  
Acao cancelada: Alemanha nao possui Poder Politico suficiente para enviar a proposta (minimo: 15)  
+15 Poder Politico  
O pais Alemanha propos um comercio para Franca  
Alemanha gastou 15 de Poder Politico  
Franca recusou o pacto de Alemanha  
