//
//  Item.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 18/12/20.
//

import UIKit

class Item: NSObject, NSCoding {

    
    //Mark - atributos
    var nome: String
    var calorias: Double
    
    
    //Mark - construtor
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
    
    //MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")
    }
    
}
