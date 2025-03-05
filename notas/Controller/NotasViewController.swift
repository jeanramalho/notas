//
//  ViewController.swift
//  notas
//
//  Created by Jean Ramalho on 03/03/25.
//

import UIKit

class NotasViewController: UIViewController {
    
    let contentView: NotasView = NotasView()
    
    var notasArray: [String] = []
    
    var notasSalvas: [String] = []
    
    var notaAtual: String = ""
    
    var indexAtual: Int?
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){

        contentView.listNotesTableView.delegate = self
        contentView.listNotesTableView.dataSource = self
        contentView.saveButton.addTarget(self, action: #selector(salvarNotas), for: .touchUpInside)
        
        loadingNotas()
        setHierarchy()
        setConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func loadingNotas(){
        buscaNotas()
        notasArray = notasSalvas
        contentView.listNotesTableView.reloadData()
    }
    
    func buscaNotas(){
        notasSalvas = UserDefaults.standard.object(forKey: "notas") as? [String] ?? []
    }
    
    private func setHierarchy(){
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func salvarNotas(){
        
        if let index = indexAtual {
            notasArray[index] = contentView.inputNote.text
            indexAtual = nil
        } else {
            notaAtual = contentView.inputNote.text
            notasArray.append(notaAtual)
        }
  
            UserDefaults.standard.set(notasArray, forKey: "notas")
            buscaNotas()
            contentView.inputNote.text = ""
            contentView.listNotesTableView.reloadData()
            
    }
    

}

extension NotasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notasSalvas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = notasSalvas[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contentView.inputNote.text = notasSalvas[indexPath.row]
        indexAtual = indexPath.row
    }
    
    //para acessar esse metodo comece a escrever commit nao editingStyle
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notasArray.remove(at: indexPath.row)
            UserDefaults.standard.set(notasArray, forKey: "notas")
            buscaNotas()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    // outro metodo para ativar botao delete da celula
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        
//        let deteteAction = UIContextualAction(style: .destructive, title: "detele") {(action, view, completionHanler) in
//            self.notasArray.remove(at: indexPath.row)
//            UserDefaults.standard.set(self.notasArray, forKey: "notas")
//            self.buscaNotas()
//            self.contentView.listNotesTableView.deleteRows(at: [indexPath], with: .automatic)
//            completionHanler(true)
//        }
//        
//        let configuration = UISwipeActionsConfiguration(actions: [deteteAction])
//        configuration.performsFirstActionWithFullSwipe = true
//        
//        return configuration
//    }
    
}

