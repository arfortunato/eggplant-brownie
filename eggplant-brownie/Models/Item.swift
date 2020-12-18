//
//  Item.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 18/12/20.
//

import UIKit

class Item: NSObject {
    
    //Mark - atributos
    var nome: String
    var calorias: Double
    
    
    //Mark - construtor
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}
