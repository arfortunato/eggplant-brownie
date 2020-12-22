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
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    
    
    //MARK: - View life cycle
    
    override func viewDidLoad(){
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        recuperaItens()
    }
    
    func recuperaItens(){
        itens = ItemDao().recupera()
    }
    
 
    
    @objc func adicionarItens(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item){
        itens.append(item)
        ItemDao().save(itens)
        //itensTableView?.reloadData()
        if let tableView = itensTableView{
            tableView.reloadData()
        }else {
            Alerta(controller: self).exibe(titulo: "Desculpe", mensagem: "Não foi possível atualizar a tabela")
        }
        
        
        
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
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else{
            
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{
           
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        refeicao.itens = itensSelecionados
        
        return refeicao
        
    }
    
    //MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
       
        //verifica se a refeicao vem opcional ou com valor para usar no delegate
        guard let refeicao = recuperaRefeicaoDoFormulario() else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulário")
            return
            
        }
        
        //Método usado para adicionar itens na tabela
        delegate?.add(refeicao)
        
        //MÉTODO USADO PARA REMOVER A TELA QUE FOI ADICIONADA
        navigationController?.popViewController(animated: true)
    }
}

