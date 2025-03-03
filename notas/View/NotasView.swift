//
//  NotasView.swift
//  notas
//
//  Created by Jean Ramalho on 03/03/25.
//
import Foundation
import UIKit

class NotasView: UIView {
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBrown
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Notas".uppercased()
        return label
    }()
    
    lazy var inputNote: UITextView = {
        let textBox = UITextView()
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.backgroundColor = UIColor(red: 234/255, green: 186/255, blue: 52/255, alpha: 1)
        textBox.textColor = .black
        textBox.font = UIFont.systemFont(ofSize: 22)
        textBox.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textBox.layer.cornerRadius = 12
        return textBox
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar Nota", for: .normal)
        button.backgroundColor = .systemBrown
        button.layer.cornerRadius = 12
        return button
    }()
    
    lazy var listNotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.text = "Minhas Notas"
        return label
    }()
    
    lazy var listNotesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .white
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        addSubview(headerView)
        addSubview(inputNote)
        
        headerView.addSubview(titleLabel)
        
        addSubview(saveButton)
        addSubview(listNotesLabel)
        addSubview(listNotesTableView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -12),
            
            inputNote.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            inputNote.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputNote.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            inputNote.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            
            saveButton.topAnchor.constraint(equalTo: inputNote.bottomAnchor, constant: 12),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 42),
            
            listNotesLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 12),
            listNotesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            listNotesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            listNotesTableView.topAnchor.constraint(equalTo: listNotesLabel.bottomAnchor, constant: 12),
            listNotesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            listNotesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            listNotesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
    }
}
