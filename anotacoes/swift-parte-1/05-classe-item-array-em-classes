
import UIKit

class Refeicao {
    
    //Mark - atributos
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    

    
    //Mark - construtor - obrigado deixar explicito a tipagem
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    //Mark - metodos
    func totalDeCalorias() -> Double {
        var total = 0.0
        for item in itens{
            total += item.calorias
        }
        return total
    }

}

class Item {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}

let refeicao = Refeicao(nome: "Macarrão", felicidade: "5")



let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijão", calorias: 90.0)
let contraFile = Item(nome: "Contra Filé", calorias: 287.0)

refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)

print(refeicao.nome)
if let primeiroItemDaLista = refeicao.itens.first{
    print(primeiroItemDaLista.nome)
}


print(refeicao.totalDeCalorias())
