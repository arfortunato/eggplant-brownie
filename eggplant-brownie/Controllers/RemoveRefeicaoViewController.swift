//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 22/12/20.
//

import UIKit

class RemoveRefeicaoViewController{
    
    //metodo para estanciar o metodo present
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe (_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        
        //controlador de alerta
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        
        let botaoCancelar = UIAlertAction(title: "ok", style: .cancel)
        alerta.addAction(botaoCancelar)
        
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)//Closure funcao dentro de funcao precisa usar self
        
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
    
}
