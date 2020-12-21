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
    var itens: Array<Item> = []
    

    
    //Mark - construtor - obrigado deixar explicito a tipagem
    //inicializando item com valor default, evita erros, e também evita inicializar todos os itens na lista como vazio, manualmente
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
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
