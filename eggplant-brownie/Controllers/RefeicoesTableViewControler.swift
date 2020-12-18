//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 18/12/20.
//

import UIKit

class RefeicoesTableViewControler: UITableViewController {
    
    let refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Tainha", felicidade: 5),
                     Refeicao(nome: "Farofa", felicidade: 5),
                     Refeicao(nome: "Anchova", felicidade: 5),
                     Refeicao(nome: "Camarão", felicidade: 5),]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
}
