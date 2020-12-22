//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 22/12/20.
//

import UIKit

class Alerta {
    
    //metodo para estanciar o metodo present
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    
    func exibe(titulo: String = "Desculpe", mensagem: String){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
