//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 18/12/20.
//

import UIKit

class Refeicao: NSObject, NSCoding {

    
    //Mark - atributos
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    

    
    //Mark - Init - construtor - obrigado deixar explicito a tipagem
    //inicializando item com valor default, evita erros, e também evita inicializar todos os itens na lista como vazio, manualmente
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    //MARk: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    
    //Mark - metodos
    func totalDeCalorias() -> Double {
        var total = 0.0
        for item in itens{
            total += item.calorias
        }
        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens{
           mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
}
