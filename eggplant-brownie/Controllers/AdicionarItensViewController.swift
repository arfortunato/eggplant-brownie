//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 21/12/20.
//

import UIKit


protocol AdicionaItensDelegate {
    func add (_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    
    //MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: - IBAction

    
    @IBAction func adicionarItem(_ sender: Any) {

//        if let nome = nomeTextField.text{
//            nome
//        }
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else {return}
        
        if let numeroDeCalorias = Double(calorias){
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            //if se a variavel existe ele executa esse metodo
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }

    }
    
}
