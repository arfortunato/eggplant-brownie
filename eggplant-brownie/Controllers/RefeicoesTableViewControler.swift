//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 18/12/20.
//

import UIKit

class RefeicoesTableViewControler: UITableViewController, AdicionaRefeicaoDelegate{
    
//    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
//                     Refeicao(nome: "Tainha", felicidade: 5),
//                     Refeicao(nome: "Farofa", felicidade: 5),
//                     Refeicao(nome: "Anchova", felicidade: 5),
//                     Refeicao(nome: "Camarão", felicidade: 5)]
    
    var refeicoes: [Refeicao] = []
    
    
    override func viewDidLoad() {

        refeicoes = RefeicaoDao().recupera()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        
        //Metodo de gesto para pressionar
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    //O underline serve ocultar o parametro do metodo, pode ocultar um ou varios parametros, depende de cada situação e legibilidade do código
    func add(_ refeicao: Refeicao){
        //adiciona alimento
        refeicoes.append(refeicao)
        //Recarrega a tabela
        tableView.reloadData()
        RefeicaoDao().save(refeicoes)
    
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        //verifica o estado do gesture, para verificar a pressao apenas no começo
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else {return}
            
            let refeicao = refeicoes [indexPath.row]
            
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: { alerta in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            
        }
    }
    
    
    
    //Método se prepara antes de seguir para o proximo view controler, colocar identificador com segue.identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //identificador para evitar problemas com crash
        if segue.identifier == "adicionar"{
            if let viewControler = segue.destination as? ViewController{
                viewControler.delegate = self
            }
        }
    }
}
