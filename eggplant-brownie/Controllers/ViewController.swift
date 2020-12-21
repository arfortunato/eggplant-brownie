//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Artur Rodrigues Fortunato on 16/12/20.
//

import UIKit
//Delegate novo padrão de design
//delegando responsabilidades equivalente a interfaces em outras linguagens, contempla o principio do encapsulamento, deixando apenas essa func add acessivel
protocol AdicionaRefeicaoDelegate {
    
    //definir apenas essa parte do método
    func add(_ refeicao: Refeicao)
}

//UITableViewDelegate - identificar o clique o usuário na tela

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate{
    
    //MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de Tomate", calorias: 40),
                         Item(nome: "Queijo", calorias: 40),
                         Item(nome: "Molho Apimentado", calorias: 40),
                         Item(nome: "Manjeiricão", calorias: 40),]
    
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView!
    
    
    
    //MARK: - View life cycle
    
    override func viewDidLoad(){
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        }
    
    @objc func adicionarItens(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item){
        itens.append(item)
        itensTableView.reloadData()
    }

    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell (style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            
            //adiciona o item selecionado da lista
            itensSelecionados.append(itens[linhaDaTabela])
        }else{
            celula.accessoryType = .none
            
            //remove o item selecionado da lista
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text{
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaRefeicao){
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
//            }else{
//                print("Erro ao tentar criar a refeição")
//            }
//        }
        
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        refeicao.itens = itensSelecionados
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        //Método usado para adicionar itens na tabela
        delegate?.add(refeicao)
        
        //MÉTODO USADO PARA REMOVER A TELA QUE FOI ADICIONADA
        navigationController?.popViewController(animated: true)
    }
}

