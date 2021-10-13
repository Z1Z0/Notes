//
//  MyNotesView.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 01/10/2021.
//

import Foundation
import UIKit

@objc protocol ButtonDelegate: AnyObject {
    func buttonAction()
}

class MyNotesView: UIView {
    
    private weak var delegate: ButtonDelegate?
    
    let dataSource = MyNotesDataSource()
    
    lazy var viewModel: MyNotesViewModel = {
        let viewModel = MyNotesViewModel(dataSource: dataSource)
        return viewModel
    }()

    init(frame: CGRect, delegate: ButtonDelegate) {
        super.init(frame: frame)
        backgroundColor = .customLightGray
        self.delegate = delegate
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var noteSearchBarController: UISearchController = {
        let searchBarController = UISearchController(searchResultsController: nil)
//        sc.searchResultsUpdater = self
//        sc.delegate = self
        searchBarController.searchBar.searchTextField.borderStyle = .none
        searchBarController.searchBar.searchTextField.layer.cornerRadius = 8
        searchBarController.searchBar.searchTextField.backgroundColor = .white
        searchBarController.obscuresBackgroundDuringPresentation = false
        searchBarController.searchBar.autocapitalizationType = .none
        return searchBarController
    }()
    
    var noteSearchBar: UISearchController {
        return noteSearchBarController
    }
    
    lazy var notesTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.registerCellNib(cellClass: NoteTableViewCell.self)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var createNoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+ Create note", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .toucheSemiBold(size: 14)
        button.backgroundColor = .customLightOrange
        button.layer.cornerRadius = 8
        button.addTarget(delegate, action: #selector(delegate?.buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            notesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            notesTableView.bottomAnchor.constraint(equalTo: createNoteButton.topAnchor, constant: 0),
            notesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            notesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            createNoteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            createNoteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            createNoteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            createNoteButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private lazy var customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupSearchBar() {
        let font: UIFont = .toucheRegular(size: 14)
        let placeholderAttributes = NSAttributedString(string: "Search here..", attributes: [.foregroundColor: UIColor.customMediumGray, .font: font])
        noteSearchBarController.searchBar.searchTextField.attributedPlaceholder = placeholderAttributes
        noteSearchBarController.searchBar.searchTextField.font = font
        noteSearchBarController.searchBar.searchTextField.textColor = .customDarkGray
    }
    
    private func addSubviews() {
        addSubview(notesTableView)
        addSubview(createNoteButton)
    }
    
    func layoutUI() {
        addSubviews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSearchBar()
    }
    
}
