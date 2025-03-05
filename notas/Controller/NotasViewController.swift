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
        
        setHierarchy()
        setConstraints()
    }
    
    func buscaNotas(){
        
        if let notasSalvas = UserDefaults.standard.object(forKey: "notas") as? [String] {
            self.notasSalvas = notasSalvas
        }
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
        notaAtual = contentView.inputNote.text
        notasArray.append(notaAtual)
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
        <#code#>
    }
    
    
}

