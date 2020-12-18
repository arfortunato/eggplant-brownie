//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 18/12/20.
//

import UIKit

class Refeicao: NSObject {
    
    //Mark - atributos
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    

    
    //Mark - construtor - obrigado deixar explicito a tipagem
    init(nome: String, felicidade: Int) {
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
